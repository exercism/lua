local compute = require('./hamming').compute

describe('Hamming', function ()

  it('no difference between identical strands', function ()
     assert.are.equals(0, compute('A', 'A'))
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

  it('ignores extra length on first strand when longer', function ()
     assert.are.equals(0, compute('AAAG', 'AAA'))
  end)

  it('ignores extra length on other strand when longer', function ()
     assert.are.equals(0, compute('AAA', 'AAAG'))
  end)

  it('large hamming distance', function ()
     assert.are.equals(4, compute('GATACA', 'GCATAA'))
  end)

  it('hamming distance in very long strand', function ()
     assert.are.equals(9, compute('GGACGGATTCTG', 'AGGACGGATTCT'))
  end)

end)
