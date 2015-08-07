# Description:
#   Construct a plausible compliment for the user.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot compliment me - give a nice compliment
#
# Author:
#   Devin Weaver @sukima <suki@tritarget.org>
#
class Complimentor
  @compliments: =>
    @phrases()
  @phrases: =>
    "#{@phrase()}. #{@maybe(@phrases)}"
  @phrase: =>
    @pick_one [
      @you_make_me
      @you_have_a
      @you_have
      @i_love_you
      @when_i_am
      @you_are
    ]
  @you_are: =>
    "You are#{@adverbs()}#{@adjective()}"
  @when_i_am: =>
    "When I am #{@bad_emotion()} you #{@pick_me_up()}#{@emphatic()}"
  @pick_me_up: =>
    @pick_one [
      "cheer me up"
      "kick my ass into gear"
      "put the wind back in my sails"
    ]
  @bad_emotion: =>
    @pick_one [
      "sad"
      "down"
      "upset"
      "freaking out"
      "in the lost-and-found"
      "throwing a tantrum"
    ]
  @i_love_you: =>
    "I love you"
  @you_make_me: =>
    "You make me#{@maybe @adverbs}#{@adverb()}#{@maybe 0.25, @adverbs}#{@emphatic()}"
  @you_have: =>
    "You have#{@adjectives()}#{@plural_attribute()}#{@emphatic()}"
  @you_have_a: =>
    "You have a#{@adjectives()}#{@singular_attribute()}#{@emphatic()}"
  @emphatic: =>
    picks = [
      "really"
      "you really do"
      "you do"
      => "I swear#{@maybe " it"}"
      => "#{@maybe "up"}on my grandmother's grave"
      "by Jove"
      "you don't even know"
      "seriously"
      "I mean it"
    ]
    @maybe 0.95, => ", #{@pick_one picks}#{@maybe 0.3, @emphatic}"
  @adjectives: =>
    @adjective() + @maybe(0.25, @adjectives)
  @adjective: =>
    " " + @pick_one ["beautiful", "glorious", "wonderful", "wiggly"]
  @plural_attribute: =>
    " " + @pick_one ["eyes", "ears", "fingers", "thumbs", "toes", "feet", "nostrils", "hair"]
  @singular_attribute: =>
    " " + @pick_one ["voice", "nose", "face", "sense of humor", "poise", "grace", "mind", "heart", "soul", "laugh"]
  @adverbs: =>
    @adverb() + @maybe(0.25, @adverbs)
  @adverb: =>
    " " + @pick_one ["with happiness", "ecstatically", "beautifully", "gloriously"]
  @pick_one: (choices) =>
    choice = choices[ Math.floor(Math.random() * choices.length) ]
    return choice if typeof choice is "string"
    return choice()
  @maybe: (p, choice) =>
    if arguments.length is 1
      choice = p
      p = 0.5
    return "" unless (Math.random() < p)
    return choice if typeof choice is "string"
    return choice()

module.exports = (robot) ->
  robot.respond /compliment(\s+me)?$/i, (msg) ->
    msg.send Complimentor.compliments()
