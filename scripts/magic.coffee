# Description:
#   Lets put a little magic in the air
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   magic - Shia Lebeouf helps set the mood with a bit of magic.
#
# Author:
#   @bsutt123

getRandomIntegerBelow = (max) ->
  Math.floor(Math.random() * Math.floor(max))

maybe = (p, fn) ->
  max = parseInt(process.env.MAGIC_MAX_PERCENTAGE, 10) || 100
  randomValue = getRandomIntegerBelow(max)
  if (randomValue < p)
    fn()

module.exports = (robot) ->
  robot.hear /\bmagic\b/i, (message) ->
    maybe 66, ->
      message.send "https://giphy.com/gifs/shia-labeouf-12NUbkX6p4xOO4"
