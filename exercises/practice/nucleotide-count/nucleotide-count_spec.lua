local DNA = require('nucleotide-count')

describe('nucleotide-count', function()
  it('has no nucleotides', function()
    local expected =  { A = 0, T = 0, C = 0, G = 0 }
    dna = DNA:new('')
    local result = dna.nucleotideCounts
    assert.are.same(expected, result)
  end)

  it('has no adenosine', function()
    local dna = DNA:new('')
    local expected = 0
    result = dna:count('A')
    assert.are.same(expected, result)
 end)

  it('repetitive cytosine gets counts', function()
    local dna = DNA:new('CCCCC')
    local expected = 5
    result = dna:count('C')
    assert.are.same(expected, result)
  end)

  it('repetitive sequence has only guanosine', function()
    local dna = DNA:new('GGGGGGGG')
    expected = { A = 0, T = 0, C = 0, G = 8 }
    result = dna.nucleotideCounts
    assert.are.same(expected, result)
  end)

  it('counts only thymine', function()
    local dna = DNA:new('GGGGTAACCCGG')
    expected = 1
    result = dna:count('T')
    assert.are.same(expected, result)
  end)

  it('counts a nucleotide only once', function()
    local dna = DNA:new('GGTTGG')
    expected = 2
    result = dna:count('T')
    assert.are.same(expected, result)
  end)

  it('validates nucleotides', function()
    local dna = DNA:new('GGTTGG')
     assert.has.errors(function() dna:count('X') end)
     assert.has_error(function() dna:count('X') end, 'Invalid Nucleotide')
  end)

  it('counts all nucleotides', function()
    local dna = DNA:new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
    expected = { A = 20, T = 21, G = 17, C = 12 }
    result = dna.nucleotideCounts
    assert.are.same(expected, result)
  end)
end)
