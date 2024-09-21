local affine_cipher = require('affine-cipher')

describe('affine-cipher', function()
  describe('encode', function()
    it('encode yes', function()
      local phrase = 'yes'
      local expected = 'xbt'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 5, b = 7 }))
    end)

    it('encode no', function()
      local phrase = 'no'
      local expected = 'fu'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 15, b = 18 }))
    end)

    it('encode omg', function()
      local phrase = 'OMG'
      local expected = 'lvz'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 21, b = 3 }))
    end)

    it('encode o m g', function()
      local phrase = 'O M G'
      local expected = 'hjp'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 25, b = 47 }))
    end)

    it('encode mindblowingly', function()
      local phrase = 'mindblowingly'
      local expected = 'rzcwa gnxzc dgt'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 11, b = 15 }))
    end)

    it('encode numbers', function()
      local phrase = 'Testing,1 2 3, testing.'
      local expected = 'jqgjc rw123 jqgjc rw'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 3, b = 4 }))
    end)

    it('encode deep thought', function()
      local phrase = 'Truth is fiction.'
      local expected = 'iynia fdqfb ifje'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 5, b = 17 }))
    end)

    it('encode all the letters', function()
      local phrase = 'The quick brown fox jumps over the lazy dog.'
      local expected = 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
      assert.are.same(expected, affine_cipher.encode(phrase, { a = 17, b = 33 }))
    end)

    it('encode with a not coprime to m', function()
      local phrase = 'This is a test.'
      assert.has.error(function()
        affine_cipher.encode(phrase, { a = 6, b = 17 })
      end, 'a and m must be coprime.')
    end)
  end)

  describe('decode', function()
    it('decode exercism', function()
      local phrase = 'tytgn fjr'
      local expected = 'exercism'
      assert.are.same(expected, affine_cipher.decode(phrase, { a = 3, b = 7 }))
    end)

    it('decode a sentence', function()
      local phrase = 'qdwju nqcro muwhn odqun oppmd aunwd o'
      local expected = 'anobstacleisoftenasteppingstone'
      assert.are.same(expected, affine_cipher.decode(phrase, { a = 19, b = 16 }))
    end)

    it('decode numbers', function()
      local phrase = 'odpoz ub123 odpoz ub'
      local expected = 'testing123testing'
      assert.are.same(expected, affine_cipher.decode(phrase, { a = 25, b = 7 }))
    end)

    it('decode all the letters', function()
      local phrase = 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
      local expected = 'thequickbrownfoxjumpsoverthelazydog'
      assert.are.same(expected, affine_cipher.decode(phrase, { a = 17, b = 33 }))
    end)

    it('decode with no spaces in input', function()
      local phrase = 'swxtjnpvyklruoliejdcblaxkswxmhqzglf'
      local expected = 'thequickbrownfoxjumpsoverthelazydog'
      assert.are.same(expected, affine_cipher.decode(phrase, { a = 17, b = 33 }))
    end)

    it('decode with too many spaces', function()
      local phrase = 'vszzm    cly   yd cg    qdp'
      local expected = 'jollygreengiant'
      assert.are.same(expected, affine_cipher.decode(phrase, { a = 15, b = 16 }))
    end)

    it('decode with a not coprime to m', function()
      local phrase = 'Test'
      assert.has.error(function()
        affine_cipher.decode(phrase, { a = 13, b = 5 })
      end, 'a and m must be coprime.')
    end)
  end)
end)
