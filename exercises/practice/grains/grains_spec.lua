local grains = require('grains')

describe('grains', function()
  it('square 1', function()
    assert.are.equals(1, grains.square(1))
  end)

  it('square 2', function()
    assert.are.equals(2, grains.square(2))
  end)

  it('square 3', function()
    assert.are.equals(4, grains.square(3))
  end)

  it('square 4', function()
    assert.are.equals(8, grains.square(4))
  end)

  it('square 16', function()
    assert.are.equals(32768, grains.square(16))
  end)

  it('square 32', function()
    assert.are.equals(2147483648, grains.square(32))
  end)

  it('square 64', function()
    assert.are.equals(9223372036854775808, grains.square(64))
  end)

  it('total', function()
    assert.are.equals(18446744073709551615, grains.total())
  end)
end)
