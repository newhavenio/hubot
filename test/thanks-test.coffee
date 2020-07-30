Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/thanks.coffee')

describe 'thanks', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to thanks hubot', ->
    @room.user.say('alice', 'thanks hubot').then =>
      expect(@room.messages[0]).to.eql ['alice', 'thanks hubot']
      expect(@room.messages[1][0]).to.eql 'hubot'

  it 'responds to thx hubot', ->
    @room.user.say('alice', 'thx hubot').then =>
      expect(@room.messages[0]).to.eql ['alice', 'thx hubot']
      expect(@room.messages[1][0]).to.eql 'hubot'

  it 'responds to thank you hubot', ->
    @room.user.say('alice', 'thank you hubot').then =>
      expect(@room.messages[0]).to.eql ['alice', 'thank you hubot']
      expect(@room.messages[1][0]).to.eql 'hubot'

  it 'responds to @hubot thanks', ->
    @room.user.say('alice', '@hubot thanks').then =>
      expect(@room.messages[0]).to.eql ['alice', '@hubot thanks']
      expect(@room.messages[1][0]).to.eql 'hubot'

  it 'responds to @hubot thx', ->
    @room.user.say('alice', '@hubot thx').then =>
      expect(@room.messages[0]).to.eql ['alice', '@hubot thx']
      expect(@room.messages[1][0]).to.eql 'hubot'

  it 'responds to @hubot thank you', ->
    @room.user.say('alice', '@hubot thank you').then =>
      expect(@room.messages[0]).to.eql ['alice', '@hubot thank you']
      expect(@room.messages[1][0]).to.eql 'hubot'
