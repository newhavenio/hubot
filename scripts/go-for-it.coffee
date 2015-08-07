# Whenever you say "go for it," Jane amplifies your encouragment. Way to go!

imgs = [
  "http://i.imgur.com/Rsffp.jpg",
  "http://i.imgur.com/UR0XM.jpg",
  "http://i.imgur.com/fwI3i.jpg",
  "http://i.imgur.com/xvSTg.jpg",
  "http://i.imgur.com/IUuX0.jpg",
  "http://i.imgur.com/YpXKg.jpg"
  ]

module.exports = (robot) ->
  robot.hear /go for it/i, (msg) ->
    msg.send msg.random imgs


