local Darts = require('darts')

describe('darts', function()
  it('missed target', function()
    assert.equal(0, Darts.score(-9, 9))
  end)

  it('on the outer circle', function()
    assert.equal(1, Darts.score(0, 10))
  end)

  it('on the middle circle', function()
    assert.equal(5, Darts.score(-5, 0))
  end)

  it('on the inner circle', function()
    assert.equal(10, Darts.score(0, -1))
  end)

  it('exactly on center', function()
    assert.equal(10, Darts.score(0, 0))
  end)

  it('near the center', function()
    assert.equal(10, Darts.score(-0.1, -0.1))
  end)

  it('just within the inner circle', function()
    assert.equal(10, Darts.score(0.7, 0.7))
  end)

  it('just outside the inner circle', function()
    assert.equal(5, Darts.score(0.8, -0.8))
  end)

  it('just within the middle circle', function()
    assert.equal(5, Darts.score(-3.5, 3.5))
  end)

  it('just outside the middle circle', function()
    assert.equal(1, Darts.score(-3.6, -3.6))
  end)

  it('just within the outer circle', function()
    assert.equal(1, Darts.score(-7.0, 7.0))
  end)

  it('just outside the outer circle', function()
    assert.equal(0, Darts.score(7.1, -7.1))
  end)

  it('asymmetric position between the inner and middle circles', function()
    assert.equal(5, Darts.score(0.5, -4))
  end)
end)
