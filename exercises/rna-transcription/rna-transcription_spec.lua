local to_rna = require('rna-transcription')

describe('rna-transcription', function()
  it('transcribes cytosine to guanosine', function()
    assert.are.equal('G', to_rna('C'))
  end)

  it('transcribes guanosine to cytosine', function()
    assert.are.equal('C', to_rna('G'))
  end)

  it('transcribes adenosine to uracil', function()
    assert.are.equal('U', to_rna('A'))
  end)

  it('transcribes thymine to adenosine', function()
    assert.are.equal('A', to_rna('T'))
  end)

  it('transcribes all DNA nucleotides to their RNA complements', function()
    assert.are.equal('UGCACCAGAAUU', to_rna('ACGTGGTCTTAA'))
  end)
end)
