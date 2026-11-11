local rle = require('run-length-encoding')

describe('run-length-encoding', function()
  describe('run-length encode a string', function()
    it('empty string', function()
      assert.equal('', rle.encode(''))
    end)

    it('single characters only are encoded without count', function()
      assert.equal('XYZ', rle.encode('XYZ'))
    end)

    it('string with no single characters', function()
      assert.equal('2A3B4C', rle.encode('AABBBCCCC'))
    end)

    it('single characters mixed with repeated characters', function()
      assert.equal('12WB12W3B24WB', rle.encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'))
    end)

    it('multiple whitespace mixed in string', function()
      assert.equal('2 hs2q q2w2 ', rle.encode('  hsqq qww  '))
    end)

    it('lowercase characters', function()
      assert.equal('2a3b4c', rle.encode('aabbbcccc'))
    end)
  end)

  describe('run-length decode a string', function()
    it('empty string', function()
      assert.equal('', rle.decode(''))
    end)

    it('single characters only', function()
      assert.equal('XYZ', rle.decode('XYZ'))
    end)

    it('string with no single characters', function()
      assert.equal('AABBBCCCC', rle.decode('2A3B4C'))
    end)

    it('single characters with repeated characters', function()
      assert.equal('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB', rle.decode('12WB12W3B24WB'))
    end)

    it('multiple whitespace mixed in string', function()
      assert.equal('  hsqq qww  ', rle.decode('2 hs2q q2w2 '))
    end)

    it('lowercase string', function()
      assert.equal('aabbbcccc', rle.decode('2a3b4c'))
    end)
  end)

  describe('encode and then decode', function()
    it('encode followed by decode gives original string', function()
      assert.equal('zzz ZZ  zZ', rle.decode(rle.encode('zzz ZZ  zZ')))
    end)
  end)
end)
