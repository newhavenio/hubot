Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/roles.coffee')

describe 'roles', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  context 'given we know a user without a role', ->
    beforeEach ->
      @room.robot.brain.data.users = { "brady": { "name": "brady" } }

    afterEach ->
      @room.robot.brain.data.users = {}

    it 'assigns roles', ->
      @room.user.say('alice', '@hubot @brady is a scoundrel').then =>
        expect(@room.messages).to.eql [
          ['alice', '@hubot @brady is a scoundrel'],
          ['hubot', 'Ok, brady is a scoundrel.']
        ]

    it 'responds in ignorance', ->
      @room.user.say('alice', '@hubot who is @brady').then =>
        expect(@room.messages).to.eql [
          ['alice', '@hubot who is @brady'],
          ['hubot', 'brady is nothing to me.']
        ]

    it 'cannot help if it does not know', ->
      @room.user.say('alice', '@hubot who is @fzsdfkjs').then =>
        expect(@room.messages).to.eql [
          ['alice', '@hubot who is @fzsdfkjs'],
          ['hubot', 'fzsdfkjs? Never heard of \'em']
        ]

    it 'cannot assign if it does not know', ->
      @room.user.say('alice', '@hubot @fsdjklds is a scoundrel').then =>
        expect(@room.messages).to.eql [
          ['alice', '@hubot @fsdjklds is a scoundrel'],
          ['hubot', 'I don\'t know anything about fsdjklds.']
        ]

    it 'is cheeky', ->
      @room.user.say('alice', '@hubot who is you').then =>
        expect(@room.messages).to.eql [
          ['alice', '@hubot who is you'],
          ['hubot', 'Who ain\'t I?']
        ]

    it 'knows itself', ->
      @room.user.say('alice', '@hubot who is @hubot').then =>
        expect(@room.messages).to.eql [
          ['alice', '@hubot who is @hubot'],
          ['hubot', 'The best.']
        ]

    it 'is idempotent', ->
      @room.user.say('alice', '@hubot @brady is not a scoundrel').then =>
        expect(@room.messages[-2..-1]).to.eql [
          ['alice', '@hubot @brady is not a scoundrel'],
          ['hubot', 'I know.']
        ]

    context 'given we have a role', ->
      beforeEach ->
        @room.user.say('alice', '@hubot @brady is a scoundrel')

      it 'reads the role', ->
        @room.user.say('alice', '@hubot who is @brady').then =>
          expect(@room.messages[-2..-1]).to.eql [
            ['alice', '@hubot who is @brady'],
            ['hubot', 'brady is a scoundrel.']
          ]

      it 'undefines the role', ->
        @room.user.say('alice', '@hubot @brady is not a scoundrel').then =>
          expect(@room.messages[-2..-1]).to.eql [
            ['alice', '@hubot @brady is not a scoundrel'],
            ['hubot', 'Ok, brady is no longer a scoundrel.']
          ]

      it 'is idempotent', ->
        @room.user.say('alice', '@hubot @brady is a scoundrel').then =>
          expect(@room.messages[-2..-1]).to.eql [
            ['alice', '@hubot @brady is a scoundrel'],
            ['hubot', 'I know']
          ]
