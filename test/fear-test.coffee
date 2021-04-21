Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/fear.js')
litany = "I must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration. I will face my fear. I will permit it to pass over me and through me. And when it has gone past I will turn the inner eye to see its path. Where the fear has gone there will be nothing. Only I will remain."

describe 'fear', ->
  context 'with a bang', ->
    beforeEach ->
      process.env.FEAR_MAX_PERCENTAGE = "100"
      @room = helper.createRoom()

    afterEach ->
      delete process.env.FEAR_MAX_PERCENTAGE
      @room.destroy()

    it 'responds to !fear', ->
      @room.user.say('alice', '!fear').then =>
        expect(@room.messages[0..1]).to.eql [
          ['alice', '!fear'],
          ['hubot', litany]
        ]

    it 'responds to !afraid', ->
      @room.user.say('alice', '!afraid').then =>
        expect(@room.messages[0..1]).to.eql [
          ['alice', '!afraid'],
          ['hubot', litany]
        ]

  context 'without a bang', ->
    beforeEach ->
      process.env.FEAR_MAX_PERCENTAGE = "100"
      @room = helper.createRoom()

    afterEach ->
      delete process.env.FEAR_MAX_PERCENTAGE
      @room.destroy()

    it 'responds to fear', ->
      @room.user.say('alice', 'fear').then =>
        expect(@room.messages[0..1]).to.eql [
          ['alice', 'fear'],
          ['hubot', litany]
        ]

    it 'responds to afraid', ->
      @room.user.say('alice', 'afraid').then =>
        expect(@room.messages[0..1]).to.eql [
          ['alice', 'afraid'],
          ['hubot', litany]
        ]

  context 'when the feature flag is zero', ->
    beforeEach ->
      process.env.FEAR_MAX_PERCENTAGE = "0"
      @room = helper.createRoom()

    afterEach ->
      delete process.env.FEAR_MAX_PERCENTAGE
      @room.destroy()

    it 'does not respond', ->
      @room.user.say('alice', 'fear').then =>
        expect(@room.messages[0..1]).to.eql [
          ['alice', 'fear'],
        ]
