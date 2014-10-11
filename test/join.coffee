chai = require 'chai'
chai.should()
expect = chai.expect
sinon = require 'sinon'
MiyoFilters = require '../join.js'

describe 'join', ->
	ms = null
	request = null
	id = null
	stash = null
	filter = MiyoFilters.join
	call_entry_spy = null
	beforeEach ->
		ms = sinon.stub()
		ms.call_entry = (value) -> value
		call_entry_spy = sinon.spy(ms, 'call_entry')
		request = sinon.stub()
		id = 'OnTest'
		stash = null
	it 'should return undefined with no argument', ->
		ret = filter.call ms, {}, request, id, stash
		expect(ret).is.undefined
	it 'should return empty string with 0 list', ->
		ret = filter.call ms,
			join: [
			]
			, request, id, stash
		expect(ret).equal ''
	it 'should return joined string with non-zero list', ->
		ret = filter.call ms,
			join: [
				'elem 1'
				'elem 2'
			]
			, request, id, stash
		call_entry_spy.callCount.should.be.equal 2
		call_entry_spy.firstCall.calledWith('elem 1').should.be.true
		call_entry_spy.secondCall.calledWith('elem 2').should.be.true
		expect(ret).equal 'elem 1elem 2'
