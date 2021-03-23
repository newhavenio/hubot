/**
 * Description:
 * Politely remind folks posting a url in #job-board to make a PR
 *
 * Dependencies:
 *   None
 *
 * Configuration:
 *   None
 *
 * Commands:
 * post something that looks like a url
 *
 * Author:
 *   treznick
 */

function getRandomIntegerBelow(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function maybe(p, fn) {
  let randomValue = getRandomIntegerBelow(100)
  if (randomValue < p) {
    fn();
  }
}

function response() {
  return 'Hi! please post jobs via a pull request to https://github.com/newhavenio/newhavenio';
}

module.exports = function(robot) {
  robot.hear(/[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)?/gi, function(msg) {
    let max = parseInt(process.env.JOBS_SUGGESTION_MAX_PERCENTAGE, 10) || 100
    if(msg.message.user.room === process.env.JOBS_BOARD_ROOM) {
      maybe(max, function() {
        msg.send(response());
      });
    }
  });
}
