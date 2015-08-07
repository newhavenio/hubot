
module.exports = (robot) ->
  robot.hear /omg/i, (msg) ->
    msg.send "Ermahgerd!"


 