local Grains = require('grains')

describe('Grains', function()

    it('square 1', function()
        assert.are.equals(1, Grains.square(1))
    end)

    it('square 2', function()
        assert.are.equals(2, Grains.square(2))
    end)

    it('square 3', function()
        assert.are.equals(4, Grains.square(3))
    end)

    it('square 4', function()
        assert.are.equals(8, Grains.square(4))
    end)

    it('square 16', function()
        assert.are.equals(32768, Grains.square(16))
    end)

    it('square 32', function()
        assert.are.equals(2147483648, Grains.square(32))
    end)

    it('square 64', function()
        assert.are.equals(9223372036854775808, Grains.square(64))
    end)

    it('total', function()
        assert.are.equals(18446744073709551615, Grains.total())
    end)
end)
