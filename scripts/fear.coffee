# Any time someone mentions 'fear,' or 'afraid,' Jane helpfully
# reminds them: You must not fear.

littany = [
  "I must not fear.",
  "Fear is the mind-killer.",
  "Fear is the little-death that brings total obliteration.",
  "I will face my fear.",
  "I will permit it to pass over me and through me.",
  "And when it has gone past I will turn the inner eye to see its path.",
  "Where the fear has gone there will be nothing.",
  "Only I will remain."
  ]

module.exports = (robot) ->
  robot.hear /(fear|afraid)/i, (msg) ->
    msg.send littany.join(' ')


