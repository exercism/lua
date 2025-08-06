local protein_translation = require('protein-translation')

describe('protein-translation', function()
  it('empty rna sequence results in no proteins', function()
    assert.are.same({}, protein_translation.proteins(''))
  end)

  it('methionine rna sequence', function()
    assert.are.same({ 'Methionine' }, protein_translation.proteins('AUG'))
  end)

  it('phenylalanine rna sequence 1', function()
    assert.are.same({ 'Phenylalanine' }, protein_translation.proteins('UUU'))
  end)

  it('phenylalanine rna sequence 2', function()
    assert.are.same({ 'Phenylalanine' }, protein_translation.proteins('UUC'))
  end)

  it('leucine rna sequence 1', function()
    assert.are.same({ 'Leucine' }, protein_translation.proteins('UUA'))
  end)

  it('leucine rna sequence 2', function()
    assert.are.same({ 'Leucine' }, protein_translation.proteins('UUG'))
  end)

  it('serine rna sequence 1', function()
    assert.are.same({ 'Serine' }, protein_translation.proteins('UCU'))
  end)

  it('serine rna sequence 2', function()
    assert.are.same({ 'Serine' }, protein_translation.proteins('UCC'))
  end)

  it('serine rna sequence 3', function()
    assert.are.same({ 'Serine' }, protein_translation.proteins('UCA'))
  end)

  it('serine rna sequence 4', function()
    assert.are.same({ 'Serine' }, protein_translation.proteins('UCG'))
  end)

  it('tyrosine rna sequence 1', function()
    assert.are.same({ 'Tyrosine' }, protein_translation.proteins('UAU'))
  end)

  it('tyrosine rna sequence 2', function()
    assert.are.same({ 'Tyrosine' }, protein_translation.proteins('UAC'))
  end)

  it('cysteine rna sequence 1', function()
    assert.are.same({ 'Cysteine' }, protein_translation.proteins('UGU'))
  end)

  it('cysteine rna sequence 2', function()
    assert.are.same({ 'Cysteine' }, protein_translation.proteins('UGC'))
  end)

  it('tryptophan rna sequence', function()
    assert.are.same({ 'Tryptophan' }, protein_translation.proteins('UGG'))
  end)

  it('stop codon rna sequence 1', function()
    assert.are.same({}, protein_translation.proteins('UAA'))
  end)

  it('stop codon rna sequence 2', function()
    assert.are.same({}, protein_translation.proteins('UAG'))
  end)

  it('stop codon rna sequence 3', function()
    assert.are.same({}, protein_translation.proteins('UGA'))
  end)

  it('sequence of two protein codons translates into proteins', function()
    assert.are.same({ 'Phenylalanine', 'Phenylalanine' }, protein_translation.proteins('UUUUUU'))
  end)

  it('sequence of two different protein codons translates into proteins', function()
    assert.are.same({ 'Leucine', 'Leucine' }, protein_translation.proteins('UUAUUG'))
  end)

  it('translate rna strand into correct protein list', function()
    assert.are.same({ 'Methionine', 'Phenylalanine', 'Tryptophan' }, protein_translation.proteins('AUGUUUUGG'))
  end)

  it('translation stops if stop codon at beginning of sequence', function()
    assert.are.same({}, protein_translation.proteins('UAGUGG'))
  end)

  it('translation stops if stop codon at end of two-codon sequence', function()
    assert.are.same({ 'Tryptophan' }, protein_translation.proteins('UGGUAG'))
  end)

  it('translation stops if stop codon at end of three-codon sequence', function()
    assert.are.same({ 'Methionine', 'Phenylalanine' }, protein_translation.proteins('AUGUUUUAA'))
  end)

  it('translation stops if stop codon in middle of three-codon sequence', function()
    assert.are.same({ 'Tryptophan' }, protein_translation.proteins('UGGUAGUGG'))
  end)

  it('translation stops if stop codon in middle of six-codon sequence', function()
    assert.are.same({ 'Tryptophan', 'Cysteine', 'Tyrosine' }, protein_translation.proteins('UGGUGUUAUUAAUGGUUU'))
  end)

  it('sequence of two non-stop codons does not translate to a stop codon', function()
    assert.are.same({ 'Methionine', 'Methionine' }, protein_translation.proteins('AUGAUG'))
  end)

  it('unknown amino acids, not part of a codon, can\'t translate', function()
    assert.has_error(function()
      protein_translation.proteins('XYZ')
    end)
  end)

  it('incomplete rna sequence can translate if valid until a stop codon', function()
    assert.are.same({ 'Phenylalanine', 'Phenylalanine' }, protein_translation.proteins('UUCUUCUAAUGGU'))
  end)
end)
