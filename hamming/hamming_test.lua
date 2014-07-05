local compute = require('./hamming').compute

describe('Hamming', function () 

  it('no difference between identical strands', function () 
     assert.are.equals(compute('A', 'A'),0)
  end)

  it('complete hamming distance of for single nucleotide strand', function () 
     assert.are.equals(compute('A','G'),1)
  end)

  it('complete hamming distance of for small strand', function ()
     assert.are.equals(compute('AG','CT'),2)
  end)

  it('small hamming distance', function ()
     assert.are.equals(compute('AT','CT'),1)
  end)

  it('small hamming distance in longer strand', function ()
     assert.are.equals(compute('GGACG', 'GGTCG'),1)
  end)

  it('ignores extra length on first strand when longer', function ()
     assert.are.equals(compute('AAAG', 'AAA'),0)
  end)

  it('ignores extra length on other strand when longer', function ()
     assert.are.equals(compute('AAA', 'AAAG'),0)
  end)

  it('large hamming distance', function ()
     assert.are.equals(compute('GATACA', 'GCATAA'),4)
  end)

  it('hamming distance in very long strand', function ()
     assert.are.equals(compute('GGACGGATTCTG', 'AGGACGGATTCT'),9)
  end)

end)

