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

maybe = (fn) ->
  max = parseInt(process.env.GATSBY_MAX_PERCENTAGE, 10) || 0
  randomValue = getRandomIntegerBelow(100)
  console.log('env_var=' + process.env.GATSBY_MAX_PERCENTAGE)
  console.log('randomValue=' + randomValue)
  console.log('max=' + max)
  if (randomValue < max)
    fn()

module.exports = (robot) ->
  robot.hear /\bgatsby\b/i, (message) ->
    maybe () ->
      message.send "https://media.giphy.com/media/5IMcyqKbkg0O4/giphy.gif"
