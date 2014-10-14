chai = require 'chai'
chai.should()
expect = chai.expect
sinon = require 'sinon'
Miyo = require 'miyojs'
MiyoFilters = require '../join.js'

describe 'join', ->
	ms = null
	request = null
	id = null
	stash = null
	beforeEach ->
		ms = new Miyo()
		for name, filter of MiyoFilters
			ms.filters[name] = filter
		sinon.spy ms, 'call_entry'
		request = sinon.stub()
		id = 'OnTest'
		stash = null
	it 'should return undefined with no argument', ->
		entry =
			filters: ['join']
		ret = ms.call_filters entry, request, id, stash
		expect(ret).is.undefined
	it 'should return empty string with 0 list', ->
		entry =
			filters: ['join']
			argument:
				join: []
		ret = ms.call_filters entry, request, id, stash
		expect(ret).equal ''
	it 'should return joined string with non-zero list', ->
		entry =
			filters: ['join']
			argument:
				join: [
					'elem 1'
					'elem 2'
				]
		ret = ms.call_filters entry, request, id, stash
		ms.call_entry.callCount.should.be.equal 2
		ms.call_entry.firstCall.calledWith('elem 1').should.be.true
		ms.call_entry.secondCall.calledWith('elem 2').should.be.true
		expect(ret).equal 'elem 1elem 2'
