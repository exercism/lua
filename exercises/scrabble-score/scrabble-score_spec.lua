local score = require('scrabble-score').score

describe('scrabble-score', function()

  it('scores an empty word as zero', function()
    assert.are.equal(0, score(''))
  end)

  it('scores a null as zero', function()
    assert.are.equal(0, score(null))
  end)

  it('scores a very short word', function()
    assert.are.equal(1, score('a'))
  end)

  it('scores the word by the number of letters', function()
    assert.are.equal(6, score('street'))
  end)

  it('scores more complicated words with more', function()
    assert.are.equal(22, score('quirky'))
  end)

  it('scores case insensitive words', function()
    assert.are.equal(20, score('MULTIBILLIONAIRE'))
  end)

end)
