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

function maybe(p, fn) {
  if (Math.random() < p) {
    fn();
  }
}

module.exports = function(robot) {
  robot.hear(/!(fear|afraid)\b/i, function(msg) {
    msg.send(littany(' '));
  });

  robot.hear(/\b(fear|afraid)\b/i, function(msg) {
    maybe(0.02, function() {
      msg.send(littany(' '));
    });
  });
};
