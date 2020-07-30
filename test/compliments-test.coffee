Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/compliments.coffee')

describe 'compliments', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to compliment me', ->
    @room.user.say('alice', '@hubot compliment me').then =>
      expect(@room.messages[1][0]).to.eql('hubot')
