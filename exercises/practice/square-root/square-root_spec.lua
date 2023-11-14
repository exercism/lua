local SquareRoot = require 'square-root'

describe('square-root', function()
  it('root of 1', function()
    assert.equal(1, SquareRoot.squareRoot(1))
  end)

  it('root of 4', function()
    assert.equal(2, SquareRoot.squareRoot(4))
  end)

  it('root of 25', function()
    assert.equal(5, SquareRoot.squareRoot(25))
  end)

  it('root of 81', function()
    assert.equal(9, SquareRoot.squareRoot(81))
  end)

  it('root of 196', function()
    assert.equal(14, SquareRoot.squareRoot(196))
  end)

  it('root of 65025', function()
    assert.equal(255, SquareRoot.squareRoot(65025))
  end)
end)