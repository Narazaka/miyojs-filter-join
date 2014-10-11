// Generated by CoffeeScript 1.7.1

/* (C) 2014 Narazaka : Licensed under The MIT License - http://narazaka.net/license/MIT?2014 */
var MiyoFilters;

if (typeof MiyoFilters === "undefined" || MiyoFilters === null) {
  MiyoFilters = {};
}

MiyoFilters.join = function(argument, request, id, stash) {
  var element, values, _i, _len, _ref;
  if (argument.join == null) {
    return;
  }
  values = [];
  _ref = argument.join;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    element = _ref[_i];
    values.push(this.call_entry(element, request, id, stash));
  }
  return values.join('');
};

if ((typeof module !== "undefined" && module !== null) && (module.exports != null)) {
  module.exports = MiyoFilters;
}

//# sourceMappingURL=join.map
