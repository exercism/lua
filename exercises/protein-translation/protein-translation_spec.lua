local translate = require('protein-translation')

describe('protein-translation', function()
  describe('translate.codon', function()
    it('should translate AUG to Methionine', function()
      assert.equal('Methionine', translate.codon('AUG'))
    end)

    it('should translate UUU and UUC to Phenylalanine', function()
      assert.equal('Phenylalanine', translate.codon('UUU'))
      assert.equal('Phenylalanine', translate.codon('UUC'))
    end)

    it('should translate UUA and UUG to Leucine', function()
      assert.equal('Leucine', translate.codon('UUA'))
      assert.equal('Leucine', translate.codon('UUG'))
    end)

    it('should translate UCU, UCC, UCA, and UCG to Serine', function()
      assert.equal('Serine', translate.codon('UCU'))
      assert.equal('Serine', translate.codon('UCC'))
      assert.equal('Serine', translate.codon('UCA'))
      assert.equal('Serine', translate.codon('UCG'))
    end)

    it('should translate UAU and UAC to Tyrosine', function()
      assert.equal('Tyrosine', translate.codon('UAU'))
      assert.equal('Tyrosine', translate.codon('UAC'))
    end)

    it('should translate UGU and UGC to Cysteine', function()
      assert.equal('Cysteine', translate.codon('UGU'))
      assert.equal('Cysteine', translate.codon('UGC'))
    end)

    it('should translate UGG to Tryptophan', function()
      assert.equal('Tryptophan', translate.codon('UGG'))
    end)

    it('should translate UAA, UAG, and UGA to STOP codons', function()
      assert.equal('STOP', translate.codon('UAA'))
      assert.equal('STOP', translate.codon('UAG'))
      assert.equal('STOP', translate.codon('UGA'))
    end)

    it('should raise an error when an unknown codon is translated', function()
      assert.has_error(function() translate.codon('MIA') end)
    end)
  end)

  describe('translate.rna_strand', function()
    it('should translate each codon in a strand into the corresponding protein', function()
      assert.same({ 'Methionine', 'Phenylalanine', 'Tryptophan' }, translate.rna_strand('AUGUUUUGG'))
    end)

    it('should stop translation when a STOP codon is encountered', function()
      assert.same({ 'Methionine', 'Phenylalanine' }, translate.rna_strand('AUGUUUUAA'))
      assert.same({ 'Tryptophan', 'Cysteine', 'Tyrosine' }, translate.rna_strand('UGGUGUUAUUAAUGGUUU'))
    end)

    it('should raise an error when an unknown codon is encountered', function()
      assert.has_error(function() translate.rna_strand('UGUCARROT') end)
    end)

    it('should not raise an error when an unknown codon occurs after a STOP codon', function()
      assert.same({ 'Cysteine' }, translate.rna_strand('UGUUGACARROT'))
    end)
  end)
end)
