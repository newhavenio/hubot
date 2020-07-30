Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/gatsby.coffee')

describe 'gatsby', ->
  beforeEach ->
    process.env.GATSBY_MAX_PERCENTAGE = "50"
    @room = helper.createRoom()

  afterEach ->
    delete process.env.GATSBY_MAX_PERCENTAGE
    @room.destroy()

  it 'responds to gatsby', ->
    @room.user.say('alice', 'gatsby').then =>
      expect(@room.messages[0..1]).to.eql [
        ['alice', 'gatsby'],
        ['hubot', "https://media.giphy.com/media/5IMcyqKbkg0O4/giphy.gif"]
      ]
