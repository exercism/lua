local grains = require('grains')

describe('grains', function()
  describe('returns the number of grains on the square', function()
    it('grains on square 1', function()
      assert.are.equal(1, grains.square(1))
    end)

    it('grains on square 2', function()
      assert.are.equal(2, grains.square(2))
    end)

    it('grains on square 3', function()
      assert.are.equal(4, grains.square(3))
    end)

    it('grains on square 4', function()
      assert.are.equal(8, grains.square(4))
    end)

    it('grains on square 16', function()
      assert.are.equal(32768, grains.square(16))
    end)

    it('grains on square 32', function()
      assert.are.equal(2147483648, grains.square(32))
    end)

    it('grains on square 64', function()
      assert.are.equal(9.2233720368547758e+18, grains.square(64))
    end)

    it('square 0 is invalid', function()
      assert.has_error(function()
        grains.square(0)
      end, 'square must be between 1 and 64')
    end)

    it('negative square is invalid', function()
      assert.has_error(function()
        grains.square(-1)
      end, 'square must be between 1 and 64')
    end)

    it('square greater than 64 is invalid', function()
      assert.has_error(function()
        grains.square(65)
      end, 'square must be between 1 and 64')
    end)
  end)

  it('returns the total number of grains on the board', function()
    assert.are.equal(1.8446744073709552e+19, grains.total())
  end)
end)
