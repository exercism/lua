local compute = require('hamming').compute

describe('hamming', function ()
  it('identical strands', function ()
    assert.are.equal(0, compute('A', 'A'))
  end)

  it('long identical strands', function ()
    assert.are.equal(0, compute('GGACTGA', 'GGACTGA'))
  end)

  it('complete distance in single nucleotide strands', function ()
    assert.are.equal(1, compute('A', 'G'))
  end)

  it('complete distance in small strands', function ()
    assert.are.equal(2, compute('AG', 'CT'))
  end)

  it('small distance in small strands', function ()
    assert.are.equal(1, compute('AT', 'CT'))
  end)

  it('small distance', function ()
    assert.are.equal(1, compute('GGACG', 'GGTCG'))
  end)

  it('small distance in long strands', function ()
    assert.are.equal(2, compute('ACCAGGG', 'ACTATGG'))
  end)

  it('non unique character in first strand', function ()
    assert.are.equal(1, compute('AGA', 'AGG'))
  end)

  it('non unique character in second strand', function ()
    assert.are.equal(1, compute('AGG', 'AGA'))
  end)

  it('same nucleotides in different positions', function ()
    assert.are.equal(2, compute('TAG', 'GAT'))
  end)

  it('large distance', function ()
    assert.are.equal(4, compute('GATACA', 'GCATAA'))
  end)

  it('large distance in off-by-one strand', function ()
    assert.are.equal(9, compute('GGACGGATTCTG', 'AGGACGGATTCT'))
  end)

  it('empty strands', function ()
    assert.are.equal(0, compute('', ''))
  end)

  it('disallow first strand longer', function ()
    assert.are.equal(-1, compute('AATG', 'AAA'))
  end)

  it('disallow second strand longer', function ()
    assert.are.equal(-1, compute('ATA', 'AGTG'))
  end)
end)
