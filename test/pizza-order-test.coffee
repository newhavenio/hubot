
Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/pizza-order.js')

describe 'pizza-order', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to pizza test', ->
    @room.user.say('alice', '@hubot pizza test').then =>
      expect(@room.messages).to.eql [
        ['alice', '@hubot pizza test'],
        ['hubot', "@alice this is a nested line\nrepeated xxx\nrepeated xxxxxx\nrepeated xxxxxxxxx\nright-pad: helloxxxxx\n left-pad: yyyyyhello\na big number: 1,234,567\na big dollar amount: $1,234,567.29\nrounding correctly: 14.65\ndollars correctly: $14.65\n"]
      ]

  it 'responds to pizza for', ->
    @room.user.say('alice', '@hubot pizza for 10').then =>
      expect(@room.messages).to.eql [
        ['alice', '@hubot pizza for 10'],
        ['hubot', "@alice You should get 4 large pizza(s). It should cost about $58.60.\nAssumptions:\n* 2.5 slices per person\n* 8 slices per large pizza\n* $14.65 per pizza\n"]
      ]
