local flatten = require('flatten-array')

describe('flatten-array', function()
  it('empty', function()
    local input = {}
    local expected = {}
    assert.are.same(expected, flatten(input))
  end)

  it('no nesting', function()
    local input = { 0, 1, 2 }
    local expected = { 0, 1, 2 }
    assert.are.same(expected, flatten(input))
  end)

  it('flattens a nested array', function()
    local input = { { {} } }
    local expected = {}
    assert.are.same(expected, flatten(input))
  end)

  it('flattens array with just integers present', function()
    local input = { 1, { 2, 3, 4, 5, 6, 7 }, 8 }
    local expected = { 1, 2, 3, 4, 5, 6, 7, 8 }
    assert.are.same(expected, flatten(input))
  end)

  it('5 level nesting', function()
    local input = { 0, 2, { { 2, 3 }, 8, 100, 4, { { { 50 } } } }, -2 }
    local expected = { 0, 2, 2, 3, 8, 100, 4, 50, -2 }
    assert.are.same(expected, flatten(input))
  end)

  it('5 level nesting with multiple nested arrays', function()
    local input = { 1, { 2, { { 3 } }, { 4, { { 5 } } }, 6, 7 }, 8 }
    local expected = { 1, 2, 3, 4, 5, 6, 7, 8 }
    assert.are.same(expected, flatten(input))
  end)
end)
