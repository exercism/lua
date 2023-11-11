local assert = require('luassert.assert')
local say = require('say')

local function lteq(state, arguments)
  assert(#arguments == 2, 'expected two argument to assert.lteq')

  local a = arguments[1]
  local b = arguments[2]

  return a <= b
end

say:set("assertion.lteq.positive", "Expected\n%s\nto be less than or equal to\n%s")
say:set("assertion.lteq.negative", "Expected\n%s\nto not be less than or equal to\n%s")
assert:register("assertion", "lteq", lteq, 'assertion.lteq.positive', 'assertion.lteq.negative')
