local knapsack = require 'knapsack'

describe('knapsack', function()
  it('no items', function()
    local items = {}
    local maximum_weight = 100
    assert.are.equal(0, knapsack.maximum_value(maximum_weight, items))
  end)

  it('one item too heavy', function()
    local items = { { weight = 100, value = 1 } }
    local maximum_weight = 10

    assert.are.equal(0, knapsack.maximum_value(maximum_weight, items))
  end)

  it('five items cannot be greedy by weight', function()
    local items = {
      { weight = 2, value = 5 },
      { weight = 2, value = 5 },
      { weight = 2, value = 5 },
      { weight = 2, value = 5 },
      { weight = 10, value = 21 }
    }
    local maximum_weight = 10

    assert.are.equal(21, knapsack.maximum_value(maximum_weight, items))
  end)

  it('five items cannot be greedy by value', function()
    local items = {
      { weight = 2, value = 20 },
      { weight = 2, value = 20 },
      { weight = 2, value = 20 },
      { weight = 2, value = 20 },
      { weight = 10, value = 50 }
    }
    local maximum_weight = 10

    assert.are.equal(80, knapsack.maximum_value(maximum_weight, items))
  end)

  it('example knapsack', function()
    local items = {
      { weight = 5, value = 10 },
      { weight = 4, value = 40 },
      { weight = 6, value = 30 },
      { weight = 4, value = 50 }
    }
    local maximum_weight = 10

    assert.are.equal(90, knapsack.maximum_value(maximum_weight, items))
  end)

  it('eight items', function()
    local items = {
      { weight = 5, value = 10 },
      { weight = 25, value = 350 },
      { weight = 35, value = 400 },
      { weight = 45, value = 450 },
      { weight = 5, value = 20 },
      { weight = 25, value = 70 },
      { weight = 3, value = 8 },
      { weight = 2, value = 5 },
      { weight = 2, value = 5 }
    }
    local maximum_weight = 104

    assert.are.equal(900, knapsack.maximum_value(maximum_weight, items))
  end)

  it('fifteen items', function()
    local items = {
      { weight = 70, value = 135 },
      { weight = 73, value = 139 },
      { weight = 77, value = 149 },
      { weight = 80, value = 150 },
      { weight = 82, value = 156 },
      { weight = 87, value = 163 },
      { weight = 90, value = 173 },
      { weight = 94, value = 184 },
      { weight = 98, value = 192 },
      { weight = 106, value = 201 },
      { weight = 110, value = 210 },
      { weight = 113, value = 214 },
      { weight = 115, value = 221 },
      { weight = 118, value = 229 },
      { weight = 120, value = 240 }
    }
    local maximum_weight = 750

    assert.are.equal(1458, knapsack.maximum_value(maximum_weight, items))
  end)
end)
