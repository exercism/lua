local toRna = require('./rna-transcription')

describe("toRna()", function() 
  it("transcribes cytidine to guanosine", function() 
    assert.are.equals(toRna('C'),'G')
  end)

  it("transcribes guanosine to cytidine", function()
    assert.are.equals(toRna('G'),'C')
  end)

  it("transcribes adenosine to uracil", function()
    assert.are.equals(toRna('A'),'U')
  end)

  it("transcribes thymidine to adenosine", function()
    assert.are.equals(toRna('T'),'A')
  end)

  it("transcribes all dna nucleotides to their rna complements", function()
    assert.are.equals(toRna('ACGTGGTCTTAA'),'UGCACCAGAAUU')
  end)
end)
