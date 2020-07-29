Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/bees.coffee')

describe 'bees', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to these bees', ->
    @room.user.say('alice', 'these bees').then =>
      expect(@room.messages).to.eql [
        ['alice', 'these bees'],
        ['hubot', 'http://i.imgur.com/qrLEV.gif']
      ]

  it 'does not respond to beesknees', ->
    @room.user.say('alice', 'beesknees').then =>
      expect(@room.messages).to.eql [
        ['alice', 'beesknees']
      ]

  it 'does not respond to bees alone', ->
    @room.user.say('alice', 'bees alone').then =>
      expect(@room.messages).to.eql [
        ['alice', 'bees alone']
      ]
