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
  robot.hear /\bbees*\b/i, (message) ->
    if Math.random() < .2
      message.send "https://giphy.com/gifs/bees-SRKQ1Y0TB4n1m"
    else
      message.send "http://i.imgur.com/qrLEV.gif"
# http://rubular.com/r/7VE6kR3EbX