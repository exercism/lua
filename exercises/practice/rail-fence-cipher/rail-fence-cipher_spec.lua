local rfc = require('rail-fence-cipher')

describe('rail-fence-cipher', function()
  describe('encode', function()
    it('encode with two rails', function()
      assert.are.equal('XXXXXXXXXOOOOOOOOO', rfc.encode('XOXOXOXOXOXOXOXOXO', 2))
    end)

    it('encode with three rails', function()
      assert.are.equal('WECRLTEERDSOEEFEAOCAIVDEN', rfc.encode('WEAREDISCOVEREDFLEEATONCE', 3))
    end)

    it('encode with ending in the middle', function()
      assert.are.equal('ESXIEECSR', rfc.encode('EXERCISES', 4))
    end)
  end)

  describe('decode', function()
    it('decode with three rails', function()
      assert.are.equal('THEDEVILISINTHEDETAILS', rfc.decode('TEITELHDVLSNHDTISEIIEA', 3))
    end)

    it('decode with five rails', function()
      assert.are.equal('EXERCISMISAWESOME', rfc.decode('EIEXMSMESAORIWSCE', 5))
    end)

    it('decode with six rails', function()
      assert.are.equal('112358132134558914423337761098715972584418167651094617711286',
                       rfc.decode('133714114238148966225439541018335470986172518171757571896261', 6))
    end)
  end)
end)
