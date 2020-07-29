Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/be-excellent.coffee')

describe 'be-excellent', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to be excellent', ->
    @room.user.say('alice', 'be excellent').then =>
      expect(@room.messages).to.eql [
        ['alice', 'be excellent'],
        ['hubot', 'https://giphy.com/gifs/justin-bill-teds-excellent-adventure-and-ted-be-l4KhRsScQKgWZzqO4']
      ]
