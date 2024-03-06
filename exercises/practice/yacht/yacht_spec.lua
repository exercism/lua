local yacht = require('yacht')

describe('yacht', function()
  it('yacht', function()
    assert.are.equal(50, yacht.score({ 5, 5, 5, 5, 5 }, 'yacht'))
  end)

  it('not yacht', function()
    assert.are.equal(0, yacht.score({ 1, 3, 3, 2, 5 }, 'yacht'))
  end)

  it('ones', function()
    assert.are.equal(3, yacht.score({ 1, 1, 1, 3, 5 }, 'ones'))
  end)

  it('ones, out of order', function()
    assert.are.equal(3, yacht.score({ 3, 1, 1, 5, 1 }, 'ones'))
  end)

  it('no ones', function()
    assert.are.equal(0, yacht.score({ 4, 3, 6, 5, 5 }, 'ones'))
  end)

  it('twos', function()
    assert.are.equal(2, yacht.score({ 2, 3, 4, 5, 6 }, 'twos'))
  end)

  it('fours', function()
    assert.are.equal(8, yacht.score({ 1, 4, 1, 4, 1 }, 'fours'))
  end)

  it('yacht counted as threes', function()
    assert.are.equal(15, yacht.score({ 3, 3, 3, 3, 3 }, 'threes'))
  end)

  it('yacht of 3s counted as fives', function()
    assert.are.equal(0, yacht.score({ 3, 3, 3, 3, 3 }, 'fives'))
  end)

  it('fives', function()
    assert.are.equal(10, yacht.score({ 1, 5, 3, 5, 3 }, 'fives'))
  end)

  it('sixes', function()
    assert.are.equal(6, yacht.score({ 2, 3, 4, 5, 6 }, 'sixes'))
  end)

  it('full house two small, three big', function()
    assert.are.equal(16, yacht.score({ 2, 2, 4, 4, 4 }, 'full house'))
  end)

  it('full house three small, two big', function()
    assert.are.equal(19, yacht.score({ 5, 3, 3, 5, 3 }, 'full house'))
  end)

  it('two pair is not a full house', function()
    assert.are.equal(0, yacht.score({ 2, 2, 4, 4, 5 }, 'full house'))
  end)

  it('four of a kind is not a full house', function()
    assert.are.equal(0, yacht.score({ 1, 4, 4, 4, 4 }, 'full house'))
  end)

  it('yacht is not a full house', function()
    assert.are.equal(0, yacht.score({ 2, 2, 2, 2, 2 }, 'full house'))
  end)

  it('four of a kind', function()
    assert.are.equal(24, yacht.score({ 6, 6, 4, 6, 6 }, 'four of a kind'))
  end)

  it('yacht can be scored as four of a kind', function()
    assert.are.equal(12, yacht.score({ 3, 3, 3, 3, 3 }, 'four of a kind'))
  end)

  it('full house is not four of a kind', function()
    assert.are.equal(0, yacht.score({ 3, 3, 3, 5, 5 }, 'four of a kind'))
  end)

  it('little straight', function()
    assert.are.equal(30, yacht.score({ 3, 5, 4, 1, 2 }, 'little straight'))
  end)

  it('little straight as big straight', function()
    assert.are.equal(0, yacht.score({ 1, 2, 3, 4, 5 }, 'big straight'))
  end)

  it('four in order but not a little straight', function()
    assert.are.equal(0, yacht.score({ 1, 1, 2, 3, 4 }, 'little straight'))
  end)

  it('no pairs but not a little straight', function()
    assert.are.equal(0, yacht.score({ 1, 2, 3, 4, 6 }, 'little straight'))
  end)

  it('minimum is 1, maximum is 5, but not a little straight', function()
    assert.are.equal(0, yacht.score({ 1, 1, 3, 4, 5 }, 'little straight'))
  end)

  it('big straight', function()
    assert.are.equal(30, yacht.score({ 4, 6, 2, 5, 3 }, 'big straight'))
  end)

  it('big straight as little straight', function()
    assert.are.equal(0, yacht.score({ 6, 5, 4, 3, 2 }, 'little straight'))
  end)

  it('no pairs but not a big straight', function()
    assert.are.equal(0, yacht.score({ 6, 5, 4, 3, 1 }, 'big straight'))
  end)

  it('choice', function()
    assert.are.equal(23, yacht.score({ 3, 3, 5, 6, 6 }, 'choice'))
  end)

  it('yacht as choice', function()
    assert.are.equal(10, yacht.score({ 2, 2, 2, 2, 2 }, 'choice'))
  end)
end)
