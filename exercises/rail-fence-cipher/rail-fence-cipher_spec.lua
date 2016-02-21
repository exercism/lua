local rfc = require('rail-fence-cipher')

describe('rail-fence-cipher', function()
  describe('encode', function()
    it('should encode with 2 rails', function()
      assert.equal('XXXXXXXXXOOOOOOOOO', rfc.encode('XOXOXOXOXOXOXOXOXO', 2))
    end)

    it('should encode with 3 rails', function()
      assert.equal('WECRLTEERDSOEEFEAOCAIVDEN', rfc.encode('WEAREDISCOVEREDFLEEATONCE', 3))
    end)

    it('should encode with 4 rails', function()
      assert.equal('ESXIMEC.ORI', rfc.encode('EXERCISM.IO', 4))
    end)

    it('should encode with many rails', function()
      assert.equal('ALLEOLBNYEGORTUAOREUBSSA', rfc.encode('ALLYOURBASEAREBELONGTOUS', 9))
    end)

    it('should encode correctly when ending on a middle rail', function()
      assert.equal('ESXIEECSR', rfc.encode('EXERCISES', 4))
    end)
  end)

  describe('decode', function()
    it('should decode with 3 rails', function()
      assert.equal('THEDEVILISINTHEDETAILS', rfc.decode('TEITELHDVLSNHDTISEIIEA', 3))
    end)

    it('should decode with 5 rails', function()
      assert.equal('EXERCISMISAWESOME', rfc.decode('EIEXMSMESAORIWSCE', 5))
    end)

    it('should decode with 6 rails', function()
      assert.equal(
        '112358132134558914423337761098715972584418167651094617711286',
        rfc.decode('133714114238148966225439541018335470986172518171757571896261', 6)
      )
    end)

    it('should decode with many rails', function()
      assert.equal('ALLYOURBASEAREBELONGTOUS', rfc.decode('ALLEOLBNYEGORTUAOREUBSSA', 9))
    end)
  end)
end)
