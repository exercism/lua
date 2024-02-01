local spiral_matrix = require('spiral-matrix')

-- LuaFormatter off
describe('spiral_matrix', function()
  it('empty spiral', function()
    local expected = {}
    assert.are.same(expected, spiral_matrix(0))
  end)

  it('trivial spiral', function()
    local expected = {
      { 1 }
    }
    assert.are.same(expected, spiral_matrix(1))
  end)

  it('spiral of size 2', function()
    local expected = {
      { 1, 2 },
      { 4, 3 }
    }
    assert.are.same(expected, spiral_matrix(2))
  end)

  it('spiral of size 3', function()
    local expected = {
      { 1, 2, 3 },
      { 8, 9, 4 },
      { 7, 6, 5 }
    }
    assert.are.same(expected, spiral_matrix(3))
  end)

  it('spiral of size 4', function()
    local expected = {
      { 1, 2, 3, 4 },
      { 12, 13, 14, 5 },
      { 11, 16, 15, 6 },
      { 10, 9, 8, 7 }
    }
    assert.are.same(expected, spiral_matrix(4))
  end)

  it('spiral of size 5', function()
    local expected = {
      { 1, 2, 3, 4, 5 },
      { 16, 17, 18, 19, 6 },
      { 15, 24, 25, 20, 7 },
      { 14, 23, 22, 21, 8 },
      { 13, 12, 11, 10, 9 }
    }
    assert.are.same(expected, spiral_matrix(5))
  end)
end)
-- LuaFormatter on
