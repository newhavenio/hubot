# Description:
#   Gatsby is great and should be honored as such
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   gatsby - the great man himself
#
# Author:
#   @maxx1128

getRandomIntegerBelow = (max) ->
  Math.floor(Math.random() * Math.floor(max))

maybe = (p, fn) ->
  max = parseInt(process.env.GATSBY_MAX_PERCENTAGE, 10) || 100
  randomValue = getRandomIntegerBelow(max)
  if (randomValue < p)
    fn()

module.exports = (robot) ->
  robot.hear /\bgatsby\b/i, (message) ->
    maybe 50, () ->
      message.send "https://media.giphy.com/media/5IMcyqKbkg0O4/giphy.gif"
