/**
 * Description:
 *   Any time (sometimes) someone mentions 'fear,' or 'afraid,' the bot helpfully
 *   reminds them: You must not fear.
 *
 * Dependencies:
 *   None
 *
 * Configuration:
 *   None
 *
 * Commands:
 *   Just say 'fear'. Maybe you'll get some help. Maybe not.
 *
 * Author:
 *   danbernier
 */

function littany() {
  return [
    "I must not fear.",
    "Fear is the mind-killer.",
    "Fear is the little-death that brings total obliteration.",
    "I will face my fear.",
    "I will permit it to pass over me and through me.",
    "And when it has gone past I will turn the inner eye to see its path.",
    "Where the fear has gone there will be nothing.",
    "Only I will remain."
  ].join(' ');
}

function getRandomIntegerBelow(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function maybe(p, fn) {
  let max = parseInt(process.env.FEAR_MAX_PERCENTAGE, 10) || 100
  let randomValue = getRandomIntegerBelow(max)
  if (randomValue < p) {
    fn();
  }
}

module.exports = function(robot) {
  robot.hear(/!(fear|afraid)\b/i, function(msg) {
    msg.send(littany(' '));
  });

  robot.hear(/\b(fear|afraid)\b/i, function(msg) {
    maybe(20, function() {
      msg.send(littany(' '));
    });
  });
};
