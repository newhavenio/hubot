# Description:
#   Be excellent to each other
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   be excellent - Bill and Ted share some sage advice for us all
#
# Author:
#   bsutt123

module.exports = (robot) ->
  robot.hear /\bbe\sexcellent\b/i, (msg) ->
    msg.send "https://giphy.com/gifs/justin-bill-teds-excellent-adventure-and-ted-be-l4KhRsScQKgWZzqO4"