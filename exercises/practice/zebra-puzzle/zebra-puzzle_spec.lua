local zebra_puzzle = require('zebra-puzzle')

describe('zebra-puzzle', function()
  it('resident who drinks water', function()
    assert.equal('Norwegian', zebra_puzzle.drinksWater())
  end)

  it('resident who owns zebra', function()
    assert.equal('Japanese', zebra_puzzle.ownsZebra())
  end)
end)
