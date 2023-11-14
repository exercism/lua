local Darts = require 'darts'

describe('darts', function()
  it('Missed target', function()
    assert.equal(0, Darts.score(-9, 9))
  end)

  it('On the outer circle', function()
    assert.equal(1, Darts.score(0, 10))
  end)

  it('On the middle circle', function()
    assert.equal(5, Darts.score(-5, 0))
  end)

  it('On the inner circle', function()
    assert.equal(10, Darts.score(0, -1))
  end)

  it('Exactly on center', function()
    assert.equal(10, Darts.score(0, 0))
  end)

  it('Near the center', function()
    assert.equal(10, Darts.score(-0.1, -0.1))
  end)

  it('Just within the inner circle', function()
    assert.equal(10, Darts.score(0.7, 0.7))
  end)

  it('Just outside the inner circle', function()
    assert.equal(5, Darts.score(0.8, -0.8))
  end)

  it('Just within the middle circle', function()
    assert.equal(5, Darts.score(-3.5, 3.5))
  end)

  it('Just outside the middle circle', function()
    assert.equal(1, Darts.score(-3.6, -3.6))
  end)

  it('Just within the outer circle', function()
    assert.equal(1, Darts.score(-7.0, 7.0))
  end)

  it('Just outside the outer circle', function()
    assert.equal(0, Darts.score(7.1, -7.1))
  end)

  it('Asymmetric position between the inner and middle circles', function()
    assert.equal(5, Darts.score(0.5, -4))
  end)
end)
