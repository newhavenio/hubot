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

module.exports = (robot) ->
  robot.hear /\bmagic\b/i, (message) ->
    if Math.random() > .2
      message.send "https://giphy.com/gifs/shia-labeouf-12NUbkX6p4xOO4"