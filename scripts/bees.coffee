# Description:
#   Bees are insane
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   bees - Oprah at her finest, or a good way to turn the fans on coworkers machines
#
# Author:
#   atmos

module.exports = (robot) ->
  robot.hear /[^\w+]bees\b/i, (message) ->
    message.send "http://i.imgur.com/qrLEV.gif"
# http://rubular.com/r/7VE6kR3EbX