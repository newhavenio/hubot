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
    console.log("room=" + msg.message.user.room)
    console.log("jobs_room=" + process.env.JOBS_BOARD_ROOM)
    let max = parseInt(process.env.JOBS_SUGGESTION_MAX_PERCENTAGE, 10) || 100
    console.log("max=" + max)
    if(msg.message.user.room === process.env.JOBS_BOARD_ROOM) {
      console.log("room_match=true")
      maybe(max, function() {
        console.log("maybe=true")
        msg.send(response());
      });
    }
  });

  robot.respond(/!job(s)?\b/, function(msg) {
    msg.send(response());
  });
}
