local dominoes = require('dominoes')

describe('dominoes', function()
  it('empty input = empty output', function()
    local input = {}
    assert.is_true(dominoes.can_chain(input))
  end)

  it('singleton input = singleton output', function()
    local input = { { 1, 1 } }
    assert.is_true(dominoes.can_chain(input))
  end)

  it('singleton that can\'t be chained', function()
    local input = { { 1, 2 } }
    assert.is_false(dominoes.can_chain(input))
  end)

  it('three elements', function()
    local input = { { 1, 2 }, { 3, 1 }, { 2, 3 } }
    assert.is_true(dominoes.can_chain(input))
  end)

  it('can reverse dominoes', function()
    local input = { { 1, 2 }, { 1, 3 }, { 2, 3 } }
    assert.is_true(dominoes.can_chain(input))
  end)

  it('can\'t be chained', function()
    local input = { { 1, 2 }, { 4, 1 }, { 2, 3 } }
    assert.is_false(dominoes.can_chain(input))
  end)

  it('disconnected - simple', function()
    local input = { { 1, 1 }, { 2, 2 } }
    assert.is_false(dominoes.can_chain(input))
  end)

  it('disconnected - double loop', function()
    local input = { { 1, 2 }, { 2, 1 }, { 3, 4 }, { 4, 3 } }
    assert.is_false(dominoes.can_chain(input))
  end)

  it('disconnected - single isolated', function()
    local input = { { 1, 2 }, { 2, 3 }, { 3, 1 }, { 4, 4 } }
    assert.is_false(dominoes.can_chain(input))
  end)

  it('need backtrack', function()
    local input = { { 1, 2 }, { 2, 3 }, { 3, 1 }, { 2, 4 }, { 2, 4 } }
    assert.is_true(dominoes.can_chain(input))
  end)

  it('separate loops', function()
    local input = { { 1, 2 }, { 2, 3 }, { 3, 1 }, { 1, 1 }, { 2, 2 }, { 3, 3 } }
    assert.is_true(dominoes.can_chain(input))
  end)

  it('nine elements', function()
    local input = { { 1, 2 }, { 5, 3 }, { 3, 1 }, { 1, 2 }, { 2, 4 }, { 1, 6 }, { 2, 3 }, { 3, 4 }, { 5, 6 } }
    assert.is_true(dominoes.can_chain(input))
  end)

  it('separate three-domino loops', function()
    local input = { { 1, 2 }, { 2, 3 }, { 3, 1 }, { 4, 5 }, { 5, 6 }, { 6, 4 } }
    assert.is_false(dominoes.can_chain(input))
  end)
end)
