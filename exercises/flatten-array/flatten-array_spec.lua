--[[-
Note that because ipairs and the length operator work correctly only for sequences
in Lua, no arrays with nils are included in these tests. This means that the provided
example is not included here:

  input: [1,[2,3,null,4],[null],5]
  output: [1,2,3,4,5]

See https://www.lua.org/manual/5.3/manual.html#3.4.7 for more information.
]]

local flatten = require 'flatten-array'

describe('flatten-array', function()
  it('should flatten arrays with a single level of nesting', function()
    assert.are.same(
      { 1, 2, 3, 4, 5, 6, 7, 8 },
      flatten({ 1, { 2, 3, 4, 5, 6, 7 }, 8 })
    )
  end)

  it('should flatten deeply nested arrays', function()
    assert.are.same(
      { 0, 2, 2, 3, 8, 100, 4, 50, -2 },
      flatten({ 0, 2, { { 2, 3 }, 8, 100, 4, { { { 50 } } } }, -2 })
    )

    assert.are.same(
      { 1,2,3,4,5,6,7,8 },
      flatten({ 1, { 2, { { 3 } }, { 4, { { 5 } } }, 6, 7 }, 8 })
    )
  end)

  it('should flatten arrays containing empty arrays', function()
    assert.are.same(
      { 0, 2, 2, 3, 8, 100, -2 },
      flatten({ 0, 2, { { 2, 3 }, 8, { { 100 } }, { {} } }, -2 })
    )
  end)

  it('should flatten arrays with no elements to an empty array', function()
    assert.are.same(
      {},
      flatten({ { { {  } } }, { { } } })
    )
  end)
end)
