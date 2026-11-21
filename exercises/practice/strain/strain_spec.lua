local strain = require('strain')

describe('strain', function()
  it('keep on empty list returns empty list', function()
    local predicate = function(x)
      return true
    end
    local list = {}
    local expected = {}
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('keeps everything', function()
    local predicate = function(x)
      return true
    end
    local list = { 1, 3, 5 }
    local expected = { 1, 3, 5 }
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('keeps nothing', function()
    local predicate = function(x)
      return false
    end
    local list = { 1, 3, 5 }
    local expected = {}
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('keeps first and last', function()
    local predicate = function(x)
      return x % 2 == 1
    end
    local list = { 1, 2, 3 }
    local expected = { 1, 3 }
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('keeps neither first nor last', function()
    local predicate = function(x)
      return x % 2 == 0
    end
    local list = { 1, 2, 3 }
    local expected = { 2 }
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('keeps strings', function()
    local predicate = function(x)
      return x:sub(1, 1) == 'z'
    end
    local list = { 'apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot' }
    local expected = { 'zebra', 'zombies', 'zealot' }
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('keeps lists', function()
    local predicate = function(x)
      for _, value in ipairs(x) do
        if value == 5 then
          return true
        end
      end
      return false
    end
    local list = { { 1, 2, 3 }, { 5, 5, 5 }, { 5, 1, 2 }, { 2, 1, 2 }, { 1, 5, 2 }, { 2, 2, 1 }, { 1, 2, 5 } }
    local expected = { { 5, 5, 5 }, { 5, 1, 2 }, { 1, 5, 2 }, { 1, 2, 5 } }
    assert.are.same(expected, strain.keep(list, predicate))
  end)

  it('discard on empty list returns empty list', function()
    local predicate = function(x)
      return true
    end
    local list = {}
    local expected = {}
    assert.are.same(expected, strain.discard(list, predicate))
  end)

  it('discards everything', function()
    local predicate = function(x)
      return true
    end
    local list = { 1, 3, 5 }
    local expected = {}
    assert.are.same(expected, strain.discard(list, predicate))
  end)

  it('discards nothing', function()
    local predicate = function(x)
      return false
    end
    local list = { 1, 3, 5 }
    local expected = { 1, 3, 5 }
    assert.are.same(expected, strain.discard(list, predicate))
  end)

  it('discards first and last', function()
    local predicate = function(x)
      return x % 2 == 1
    end
    local list = { 1, 2, 3 }
    local expected = { 2 }
    assert.are.same(expected, strain.discard(list, predicate))
  end)

  it('discards neither first nor last', function()
    local predicate = function(x)
      return x % 2 == 0
    end
    local list = { 1, 2, 3 }
    local expected = { 1, 3 }
    assert.are.same(expected, strain.discard(list, predicate))
  end)

  it('discards strings', function()
    local predicate = function(x)
      return x:sub(1, 1) == 'z'
    end
    local list = { 'apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot' }
    local expected = { 'apple', 'banana', 'cherimoya' }
    assert.are.same(expected, strain.discard(list, predicate))
  end)

  it('discards lists', function()
    local predicate = function(x)
      for _, value in ipairs(x) do
        if value == 5 then
          return true
        end
      end
      return false
    end
    local list = { { 1, 2, 3 }, { 5, 5, 5 }, { 5, 1, 2 }, { 2, 1, 2 }, { 1, 5, 2 }, { 2, 2, 1 }, { 1, 2, 5 } }
    local expected = { { 1, 2, 3 }, { 2, 1, 2 }, { 2, 2, 1 } }
    assert.are.same(expected, strain.discard(list, predicate))
  end)
end)
