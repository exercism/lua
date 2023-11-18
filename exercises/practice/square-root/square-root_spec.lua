local SquareRoot = require 'square-root'

describe('square-root', function()
  it('root of 1', function()
    assert.equal(1, SquareRoot.square_root(1))
  end)

  it('root of 4', function()
    assert.equal(2, SquareRoot.square_root(4))
  end)

  it('root of 25', function()
    assert.equal(5, SquareRoot.square_root(25))
  end)

  it('root of 81', function()
    assert.equal(9, SquareRoot.square_root(81))
  end)

  it('root of 196', function()
    assert.equal(14, SquareRoot.square_root(196))
  end)

  it('root of 65025', function()
    assert.equal(255, SquareRoot.square_root(65025))
  end)
end)
