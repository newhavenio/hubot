Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/magic.coffee')

describe 'magic', ->
  beforeEach ->
    process.env.MAGIC_MAX_PERCENTAGE = "66"
    @room = helper.createRoom()

  afterEach ->
    delete process.env.MAGIC_MAX_PERCENTAGE
    @room.destroy()

  it 'responds to magic', ->
    @room.user.say('alice', 'magic').then =>
      expect(@room.messages[0..1]).to.eql [
        ['alice', 'magic'],
        ['hubot', "https://giphy.com/gifs/shia-labeouf-12NUbkX6p4xOO4"]
      ]
