# Description:
#   Post some Shitposting gifs when people talk about shitposting
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   shitpost with a word boundary on the beginning, so it will match all forms of shitpost*
#
# Author:
#   bsutt123
gifs = [
  "https://giphy.com/gifs/acid-may-gifdump-5pH1ZIzHe7efu",
  "https://giphy.com/gifs/jezv3ryaSh9OE",
  "https://giphy.com/gifs/yBt63pbpGfiik",
  "https://giphy.com/gifs/incomparablyme-8px9vxdVqbaJa"
  ]

module.exports = (robot) ->
  robot.hear /\bshitpost/i, (msg) ->
    if Math.random() > .5
      msg.send msg.random gifs


