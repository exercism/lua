local hamming = require('hamming')

describe('hamming', function()
  it('empty strands', function()
    assert.are.equal(0, hamming.compute("", ""))
  end)

  it('single letter identical strands', function()
    assert.are.equal(0, hamming.compute("A", "A"))
  end)

  it('single letter different strands', function()
    assert.are.equal(1, hamming.compute("G", "T"))
  end)

  it('long identical strands', function()
    assert.are.equal(0, hamming.compute("GGACTGAAATCTG", "GGACTGAAATCTG"))
  end)

  it('long different strands', function()
    assert.are.equal(9, hamming.compute("GGACGGATTCTG", "AGGACGGATTCT"))
  end)

  it('disallow first strand longer', function()
    assert.has_error(function()
      hamming.compute("AATG", "AAA")
    end, "strands must be of equal length")
  end)

  it('disallow second strand longer', function()
    assert.has_error(function()
      hamming.compute("ATA", "AGTG")
    end, "strands must be of equal length")
  end)

  it('disallow empty first strand', function()
    assert.has_error(function()
      hamming.compute("", "G")
    end, "strands must be of equal length")
  end)

  it('disallow empty second strand', function()
    assert.has_error(function()
      hamming.compute("G", "")
    end, "strands must be of equal length")
  end)
end)
