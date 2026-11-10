local DNA = require('nucleotide-count')

describe('nucleotide-count', function()
  it('empty strand', function()
    local dna = DNA:new('')
    local expected = { A = 0, C = 0, G = 0, T = 0 }
    assert.are.same(expected, dna.nucleotideCounts)
  end)

  it('can count one nucleotide in single-character input', function()
    local dna = DNA:new('G')
    local expected = { A = 0, C = 0, G = 1, T = 0 }
    assert.are.same(expected, dna.nucleotideCounts)
  end)

  it('strand with repeated nucleotide', function()
    local dna = DNA:new('GGGGGGG')
    local expected = { A = 0, C = 0, G = 7, T = 0 }
    assert.are.same(expected, dna.nucleotideCounts)
  end)

  it('strand with multiple nucleotides', function()
    local dna = DNA:new('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
    local expected = { A = 20, C = 12, G = 17, T = 21 }
    assert.are.same(expected, dna.nucleotideCounts)
  end)

  it('strand with invalid nucleotides', function()
    assert.has_error(function()
      DNA:new('AGXXACT')
    end)
  end)
end)
