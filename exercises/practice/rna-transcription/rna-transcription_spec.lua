local to_rna = require('rna-transcription')

describe('rna-transcription', function()
  it('empty rna sequence', function()
    assert.are.equal('', to_rna(''))
  end)

  it('rna complement of cytosine is guanine', function()
    assert.are.equal('G', to_rna('C'))
  end)

  it('rna complement of guanine is cytosine', function()
    assert.are.equal('C', to_rna('G'))
  end)

  it('rna complement of thymine is adenine', function()
    assert.are.equal('A', to_rna('T'))
  end)

  it('rna complement of adenine is uracil', function()
    assert.are.equal('U', to_rna('A'))
  end)

  it('rna complement', function()
    assert.are.equal('UGCACCAGAAUU', to_rna('ACGTGGTCTTAA'))
  end)
end)
