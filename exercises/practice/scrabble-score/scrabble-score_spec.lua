local scrabble_score = require('scrabble-score')

describe('scrabble-score', function()
  it('lowercase letter', function()
    assert.are.equal(1, scrabble_score.score('a'))
  end)

  it('uppercase letter', function()
    assert.are.equal(1, scrabble_score.score('A'))
  end)

  it('valuable letter', function()
    assert.are.equal(4, scrabble_score.score('f'))
  end)

  it('short word', function()
    assert.are.equal(2, scrabble_score.score('at'))
  end)

  it('short, valuable word', function()
    assert.are.equal(12, scrabble_score.score('zoo'))
  end)

  it('medium word', function()
    assert.are.equal(6, scrabble_score.score('street'))
  end)

  it('medium, valuable word', function()
    assert.are.equal(22, scrabble_score.score('quirky'))
  end)

  it('long, mixed-case word', function()
    assert.are.equal(41, scrabble_score.score('OxyphenButazone'))
  end)

  it('english-like word', function()
    assert.are.equal(8, scrabble_score.score('pinata'))
  end)

  it('empty input', function()
    assert.are.equal(0, scrabble_score.score(''))
  end)

  it('entire alphabet available', function()
    assert.are.equal(87, scrabble_score.score('abcdefghijklmnopqrstuvwxyz'))
  end)
end)
