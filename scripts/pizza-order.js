
module.exports = function(robot) {
  function flatten(a, r) {
    if (!r) { r = [] };
    for (var i = 0; i < a.length; i++) {
      if(a[i].constructor == Array) {
        r.concat(flatten(a[i], r));
      } else {
        r.push(a[i]);
      }
    }
    return r;
  }

  function repeatChar(letter, times) {
    var repeated = [];
    while(repeated.length < times) {
      repeated.push(letter);
    }
    return repeated.join('');
  }
  function rpad(item, minLength, padChar) {
    var string = String(item);
    var padding = repeatChar(padChar, Math.max(minLength - string.length, 0));
    return string + padding;
  }
  function lpad(item, minLength, padChar) {
    var string = String(item);
    var padding = repeatChar(padChar, Math.max(minLength - string.length, 0));
    return padding + string;
  }

  function formatInteger(number) {
    var parts = [];
    while (number >= 1000) {
      parts.unshift(lpad(Math.round(number) % 1000, 3, '0'));
      number = Math.floor(number / 1000);
    }
    parts.unshift(number);
    return parts.join(',');
  }

  function round(number, decimals) {
    var pow = Math.pow(10, decimals);
    return Math.round(number * pow) / pow;
  }

  function dollars(number) {
    var cents = Math.round((number % 1) * 100);
    return '$' + formatInteger(Math.round(number)) + '.' + rpad(cents, 2, '0');
  }

  function line() {
    var words = flatten([].slice.call(arguments));
    return words.join(' ') + "\n";
  }
  function succeed(ending, msg) {
    return msg + ending;
  }

  robot.hear(/test/, function(res) {
    res.reply([
        line('this', ['is', 'a', ['nested'], 'line']),
        line('repeated', repeatChar('x', 3)),
        line('repeated', repeatChar('x', 6)),
        line('repeated', repeatChar('x', 9)),
        line('right-pad:', rpad('hello', 10, 'x')),
        line(' left-pad:', lpad('hello', 10, 'y')),
        line('a big number:', formatInteger(1234567.29)),
        line('a big dollar amount:', dollars(1234567.29)),
    ].join(''));
  });

  robot.respond(/pizza for (\d+)/i, function(res) {

    var attendees = Number(res.match[1]);
    var slicesPerPerson = 2.5;
    var slicesPerPie = 8;
    var perPieCost = 14.65;

    var pizzaCount = Math.ceil(attendees * slicesPerPerson / slicesPerPie);
    var totalCost = pizzaCount * perPieCost;

    var report = [
      line("You should get", formatInteger(pizzaCount), "large pizza(s). It should cost about", succeed('.', dollars(totalCost))),
      line('Assumptions:'),
      line('*', slicesPerPerson, "slices per person"),
      line('*', slicesPerPie, "slices per large pizza"),
      line('*', dollars(perPieCost), 'per pizza'),
    ];

    res.reply(report.join(''));
  });
}
