### (C) 2014 Narazaka : Licensed under The MIT License - http://narazaka.net/license/MIT?2014 ###

unless MiyoFilters?
	MiyoFilters = {}

MiyoFilters.join = type: 'data-value', filter: (argument, request, id, stash) ->
	return unless argument?.join?
	values = []
	for element in argument.join
		values.push @call_entry element, request, id, stash
	values.join ''

if module? and module.exports?
	module.exports = MiyoFilters
