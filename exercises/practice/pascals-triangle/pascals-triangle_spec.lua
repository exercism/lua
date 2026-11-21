local Triangle = require('pascals-triangle')

describe('pascals-triangle', function()
  it('zero rows', function()
    local expected = {}
    assert.are.same(expected, Triangle(0).rows)
  end)

  it('single row', function()
    local expected = { { 1 } }
    assert.are.same(expected, Triangle(1).rows)
  end)

  it('two rows', function()
    local expected = { { 1 }, { 1, 1 } }
    assert.are.same(expected, Triangle(2).rows)
  end)

  it('three rows', function()
    local expected = { { 1 }, { 1, 1 }, { 1, 2, 1 } }
    assert.are.same(expected, Triangle(3).rows)
  end)

  it('four rows', function()
    local expected = { { 1 }, { 1, 1 }, { 1, 2, 1 }, { 1, 3, 3, 1 } }
    assert.are.same(expected, Triangle(4).rows)
  end)

  it('five rows', function()
    local expected = { { 1 }, { 1, 1 }, { 1, 2, 1 }, { 1, 3, 3, 1 }, { 1, 4, 6, 4, 1 } }
    assert.are.same(expected, Triangle(5).rows)
  end)

  it('six rows', function()
    local expected = { { 1 }, { 1, 1 }, { 1, 2, 1 }, { 1, 3, 3, 1 }, { 1, 4, 6, 4, 1 }, { 1, 5, 10, 10, 5, 1 } }
    assert.are.same(expected, Triangle(6).rows)
  end)

  it('ten rows', function()
    local expected = {
      { 1 },
      { 1, 1 },
      { 1, 2, 1 },
      { 1, 3, 3, 1 },
      { 1, 4, 6, 4, 1 },
      { 1, 5, 10, 10, 5, 1 },
      { 1, 6, 15, 20, 15, 6, 1 },
      { 1, 7, 21, 35, 35, 21, 7, 1 },
      { 1, 8, 28, 56, 70, 56, 28, 8, 1 },
      { 1, 9, 36, 84, 126, 126, 84, 36, 9, 1 }
    }
    assert.are.same(expected, Triangle(10).rows)
  end)
end)
