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

module.exports = (robot) ->
  robot.hear /\bgatsby\b/i, (message) ->
    if Math.random() > .5
      message.send "https://media.giphy.com/media/5IMcyqKbkg0O4/giphy.gif"
