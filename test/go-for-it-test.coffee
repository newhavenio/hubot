Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/go-for-it.coffee')

describe 'go-for-it', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to go for it', ->
    @room.user.say('alice', 'go for it').then =>
      expect(@room.messages[1][1]).to.match /http:\/\/i\.imgur\.com\/[A-Za-z0-9]{5}\.jpg/
