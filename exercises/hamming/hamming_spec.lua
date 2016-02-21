local compute = require('hamming').compute

describe('hamming', function ()
  it('no difference between identical strands', function ()
     assert.are.equals(0, compute('A', 'A'))
  end)

  it('long identical strands', function ()
    assert.are.equals(0, compute('GGACTGA', 'GGACTGA'))
  end)

  it('complete hamming distance of for single nucleotide strand', function ()
     assert.are.equals(1, compute('A', 'G'))
  end)

  it('complete hamming distance of for small strand', function ()
     assert.are.equals(2, compute('AG', 'CT'))
  end)

  it('small hamming distance', function ()
     assert.are.equals(1, compute('AT', 'CT'))
  end)

  it('small hamming distance in longer strand', function ()
     assert.are.equals(1, compute('GGACG', 'GGTCG'))
  end)

  it('non unique character in first strand', function ()
    assert.are.equals(1, compute('AGA', 'AGG'))
  end)

  it('non unique character in second strand', function ()
    assert.are.equals(1, compute('AGG', 'AGA'))
  end)

  it('large hamming distance', function ()
     assert.are.equals(4, compute('GATACA', 'GCATAA'))
  end)

  it('hamming distance in very long strand', function ()
     assert.are.equals(9, compute('GGACGGATTCTG', 'AGGACGGATTCT'))
  end)

  it('empty strands', function ()
    assert.are.equals(0, compute('', ''))
  end)
end)
