Helper = require 'hubot-test-helper'
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/jobs-suggestion.js')

response = "Hi! please post jobs via a pull request to https://github.com/newhavenio/newhavenio"

describe 'jobs-suggestion', ->
  context 'in #jobs', ->
    beforeEach ->
      process.env.JOBS_SUGGESTION_MAX_PERCENTAGE = "100"
      process.env.JOBS_BOARD_ROOM = "jobs"
      process.env.IOBOT_USER_ID = "iobot"
      @room = helper.createRoom({name: 'jobs'})

    afterEach ->
      delete process.env.JOBS_SUGGESTION_MAX_PERCENTAGE
      delete process.env.JOBS_BOARD_ROOM
      delete process.env.IOBOT_USER_ID
      @room.destroy()

    context 'with a url', ->
      it 'responds to a url', ->
        @room.user.say('alice', 'check out my job post here: https://www.example.com').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', 'check out my job post here: https://www.example.com'],
            ['hubot', response]
          ]

      context 'by the robot itself', ->
        it 'does not respond', ->
          @room.user.say('iobot', 'check out my job post here: https://www.example.com').then =>
            expect(@room.messages[0..1]).to.eql [
              ['iobot', 'check out my job post here: https://www.example.com']
            ]

    context 'without a url', ->
      it 'does not respond', ->
        @room.user.say('alice', 'check out my job post here: not a url').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', 'check out my job post here: not a url'],
          ]

    context 'when called directly', ->
      it 'responds', ->
        @room.user.say('alice', '@hubot !job').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', '@hubot !job'],
            ['hubot', response]
          ]

    context 'when called directly with plural', ->
      it 'responds', ->
        @room.user.say('alice', '@hubot !jobs').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', '@hubot !jobs'],
            ['hubot', response]
          ]

  context 'somewhere else', ->
    beforeEach ->
      process.env.JOBS_SUGGESTION_MAX_PERCENTAGE = "100"
      @room = helper.createRoom({name: 'general'})

    afterEach ->
      delete process.env.JOBS_SUGGESTION_MAX_PERCENTAGE
      delete process.env.JOBS_BOARD_ROOM
      @room.destroy()

    context 'with a url', ->
      it 'does not respond', ->
        @room.user.say('alice', 'check out my job post here: not a url').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', 'check out my job post here: not a url'],
          ]

    context 'when called directly', ->
      it 'responds', ->
        @room.user.say('alice', '@hubot !job').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', '@hubot !job'],
            ['hubot', response]
          ]

    context 'when called directly with plural', ->
      it 'responds', ->
        @room.user.say('alice', '@hubot !jobs').then =>
          expect(@room.messages[0..1]).to.eql [
            ['alice', '@hubot !jobs'],
            ['hubot', response]
          ]
