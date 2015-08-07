# Any time Jane hears:
# "Thanks, Jane", "thx jane", etc,
# She says "You're welcome!"

pick_one = (array) ->
  i = Math.floor(Math.random() * array.length)
  array[i]

phrases = [
  "You're welcome",
  "No problem",
  "No prob",
  "np",
  "Sure thing",
  "Anytime, sweetie",
  "Anytime",
  "Anything for you",
  "De nada, amigo",
  "Don't worry about it"
]

punc = [
  "", "!", ".", "!!"
]

emoji = ["", "", "", ":smile:", ":+1:", ":ok_hand:", ":punch:",
      ":bowtie:", ":smiley:", ":heart:", ":trollface:", ":heartbeat:",
      ":sparkles:", ":star:", ":star2:", ":smirk:", ":grinning:",
      ":smiley_cat:", ":sunflower:", ":tulip:", ":hibiscus:", ":cherry_blossom:"]

youre_welcome = () ->
  [pick_one(phrases), pick_one(punc), " ", pick_one(emoji)].join('')

module.exports = (robot) ->
  robot.hear ///(thx|thanks|thank\s+you),?\s+#{robot.name}///i, (msg) ->
    msg.send youre_welcome()

  robot.respond /(thx|thanks|thank you)/i, (msg) ->
    msg.send youre_welcome()
