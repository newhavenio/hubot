# Say wat? Say wtf? Get an image.

wats = [
  "http://i.imgur.com/k8D5F.jpg",
  "http://i.imgur.com/YgVWj.jpg",
  "http://i.imgur.com/ZEz0X.jpg",
  "http://i.imgur.com/Y1GJc.jpg",
  "http://i.imgur.com/JVrAH.jpg",
  "http://i.imgur.com/s9hK2.jpg",
  "http://i.imgur.com/HK3CG.jpg",
  "http://i.imgur.com/T3Onx.jpg",
  "http://i.imgur.com/bFhAX.jpg",
  "http://i.imgur.com/avBRm.jpg",
  "http://i.imgur.com/kzJkR.jpg",
  "http://i.imgur.com/FNhTv.jpg",
  "http://i.imgur.com/hGWxa.jpg",
  "http://i.imgur.com/3m1ap.jpg",
  "http://i.imgur.com/vC57y.jpg",
  "http://i.imgur.com/f8vg7.jpg",
  "http://i.imgur.com/i9FWY.jpg",
  "http://i.imgur.com/9HNT0.jpg"
  ]

module.exports = (robot) ->
  robot.hear /\b(wat|wtf)\b/i, (msg) ->
    msg.send msg.random wats


