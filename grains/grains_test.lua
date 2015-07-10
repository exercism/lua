local Grains = require('grains')

describe('Grains', function()

    it('square 1', function()
        assert.are.equals(Grains.square(1), 1)
    end)

    it('square 2', function()
        assert.are.equals(Grains.square(2), 2)
    end)

    it('square 3', function()
        assert.are.equals(Grains.square(3), 4)
    end)

    it('square 4', function()
        assert.are.equals(Grains.square(4), 8)
    end)

    it('square 16', function()
        assert.are.equals(Grains.square(16), 32768)
    end)

    it('square 32', function()
        assert.are.equals(Grains.square(32), 2147483648)
    end)

    it('square 64', function()
        assert.are.equals(Grains.square(64), 9223372036854775808)
    end)

    it('total', function()
        assert.are.equals(Grains.total(), 18446744073709551615)
    end)
end)