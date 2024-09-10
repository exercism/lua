local saddle_points = require('saddle-points')

describe('saddle-points', function()
  local function assert_saddle_points_are_equal(expected, actual)
    if #expected ~= #actual then
      return false
    end
    for i = 1, #expected do
      if expected[i].row ~= actual[i].row or expected[i].column ~= actual[i].column then
        return false
      end
    end
    return true
  end

  it('can identify single saddle point', function()
    local matrix = {
      { 9, 8, 7 }, --
      { 5, 3, 2 }, --
      { 6, 6, 7 } --
    }
    local expected = {
      { row = 2, column = 1 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify that empty matrix has no saddle points', function()
    local matrix = {
      {} --
    }
    local expected = {}
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify lack of saddle points when there are none', function()
    local matrix = {
      { 1, 2, 3 }, --
      { 3, 1, 2 }, --
      { 2, 3, 1 } --
    }
    local expected = {}
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify multiple saddle points in a column', function()
    local matrix = {
      { 4, 5, 4 }, --
      { 3, 5, 5 }, --
      { 1, 5, 4 } --
    }
    local expected = {
      { row = 1, column = 2 }, --
      { row = 2, column = 2 }, --
      { row = 3, column = 2 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify multiple saddle points in a row', function()
    local matrix = {
      { 6, 7, 8 }, --
      { 5, 5, 5 }, --
      { 7, 5, 6 } --
    }
    local expected = {
      { row = 2, column = 1 }, --
      { row = 2, column = 2 }, --
      { row = 2, column = 3 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify saddle point in bottom right corner', function()
    local matrix = {
      { 8, 7, 9 }, --
      { 6, 7, 6 }, --
      { 3, 2, 5 } --
    }
    local expected = {
      { row = 3, column = 3 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify saddle points in a non square matrix', function()
    local matrix = {
      { 3, 1, 3 }, --
      { 3, 2, 4 } --
    }
    local expected = {
      { row = 1, column = 3 }, --
      { row = 1, column = 1 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify that saddle points in a single column matrix are those with the minimum value', function()
    local matrix = {
      { 2 }, --
      { 1 }, --
      { 4 }, --
      { 1 } --
    }
    local expected = {
      { row = 2, column = 1 }, --
      { row = 4, column = 1 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)

  it('can identify that saddle points in a single row matrix are those with the maximum value', function()
    local matrix = {
      { 2, 5, 3, 5 } --
    }
    local expected = {
      { row = 1, column = 2 }, --
      { row = 1, column = 4 } --
    }
    assert_saddle_points_are_equal(expected, saddle_points(matrix))
  end)
end)
