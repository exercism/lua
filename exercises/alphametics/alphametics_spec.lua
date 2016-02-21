local alphametics = require('alphametics')

describe('alphametics', function()
  it('should solve short puzzles', function()
    local actual = alphametics.solve('I + BB == ILL')
    local expected = { I = 1, B = 9, L = 0 }
    assert.same(expected, actual)
  end)

  it('should solve long puzzles', function()
    local actual = alphametics.solve('SEND + MORE == MONEY')
    local expected = { S = 9, E = 5, N = 6, D = 7, M = 1, O = 0, R = 8,Y = 2 }
    assert.same(expected, actual)
  end)

  it('should solve puzzles with multiplication', function()
    local actual = alphametics.solve('IF * DR == DORI')
    local expected = { I = 8, F = 2, D = 3, R = 9, O = 1 }
    assert.same(expected, actual)
  end)

  it('should solve puzzles with any boolean expression', function()
    local actual = alphametics.solve('PI * R ^ 2 == AREA')
    local expected = { P = 9, I = 6, R = 7, A = 4, E = 0 }
    assert.same(expected, actual)
  end)
end)
