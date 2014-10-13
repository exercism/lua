local to_rna = require('./rna-transcription')

describe("to_rna()", function()

  it("transcribes cytosine to guanosine", function()
    assert.are.equals(to_rna('C'), 'G')
  end)

  it("transcribes guanosine to cytosine", function()
    assert.are.equals(to_rna('G'), 'C')
  end)

  it("transcribes adenosine to uracil", function()
    assert.are.equals(to_rna('A'), 'U')
  end)

  it("transcribes thymidine to adenosine", function()
    assert.are.equals(to_rna('T'), 'A')
  end)

  it("transcribes all DNA nucleotides to their RNA complements", function()
    assert.are.equals(to_rna('ACGTGGTCTTAA'), 'UGCACCAGAAUU')
  end)

end)
