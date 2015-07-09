local toRoman = require('roman-numerals').toRoman

describe("toRoman()", function()
    it("converts 1", function()
        assert.are.equal('I', toRoman(1))
    end)

    it("converts 2", function()
        assert.are.equal('II', toRoman(2))
    end)

    it("converts 3", function()
        assert.are.equal('III', toRoman(3))
    end)

    it("converts 4", function()
        assert.are.equal('IV', toRoman(4))
    end)

    it("converts 5", function()
        assert.are.equal('V', toRoman(5))
    end)

    it("converts 6", function()
        assert.are.equal('VI', toRoman(6))
    end)

    it("converts 9", function()
        assert.are.equal('IX', toRoman(9))
    end)

    it("converts 27", function()
        assert.are.equal('XXVII', toRoman(27))
    end)

    it("converts 48", function()
        assert.are.equal('XLVIII', toRoman(48))
    end)

    it("converts 59", function()
        assert.are.equal('LIX', toRoman(59))
    end)

    it("converts 93", function()
        assert.are.equal('XCIII', toRoman(93))
    end)

    it("converts 141", function()
        assert.are.equal('CXLI', toRoman(141))
    end)

    it("converts 163", function()
        assert.are.equal('CLXIII', toRoman(163))
    end)

    it("converts 402", function()
        assert.are.equal('CDII', toRoman(402))
    end)

    it("converts 575", function()
        assert.are.equal('DLXXV', toRoman(575))
    end)

    it("converts 911", function()
        assert.are.equal('CMXI', toRoman(911))
    end)

    it("converts 1024", function()
        assert.are.equal('MXXIV', toRoman(1024))
    end)

    it("converts 3000", function()
        assert.are.equal('MMM', toRoman(3000))
    end)
end)
