local atbash_cipher = require('atbash-cipher')

describe('atbash-cipher', function()
  describe('encode', function()
    it('encode yes', function()
      local phrase = 'yes'
      local expected = 'bvh'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode no', function()
      local phrase = 'no'
      local expected = 'ml'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode omg', function()
      local phrase = 'OMG'
      local expected = 'lnt'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode spaces', function()
      local phrase = 'O M G'
      local expected = 'lnt'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode mindblowingly', function()
      local phrase = 'mindblowingly'
      local expected = 'nrmwy oldrm tob'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode numbers', function()
      local phrase = 'Testing,1 2 3, testing.'
      local expected = 'gvhgr mt123 gvhgr mt'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode deep thought', function()
      local phrase = 'Truth is fiction.'
      local expected = 'gifgs rhurx grlm'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)

    it('encode all the letters', function()
      local phrase = 'The quick brown fox jumps over the lazy dog.'
      local expected = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
      local result = atbash_cipher.encode(phrase)
      assert.are.same(expected, result)
    end)
  end)

  describe('decode', function()
    it('decode exercism', function()
      local phrase = 'vcvix rhn'
      local expected = 'exercism'
      local result = atbash_cipher.decode(phrase)
      assert.are.same(expected, result)
    end)

    it('decode a sentence', function()
      local phrase = 'zmlyh gzxov rhlug vmzhg vkkrm thglm v'
      local expected = 'anobstacleisoftenasteppingstone'
      local result = atbash_cipher.decode(phrase)
      assert.are.same(expected, result)
    end)

    it('decode numbers', function()
      local phrase = 'gvhgr mt123 gvhgr mt'
      local expected = 'testing123testing'
      local result = atbash_cipher.decode(phrase)
      assert.are.same(expected, result)
    end)

    it('decode all the letters', function()
      local phrase = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
      local expected = 'thequickbrownfoxjumpsoverthelazydog'
      local result = atbash_cipher.decode(phrase)
      assert.are.same(expected, result)
    end)

    it('decode with too many spaces', function()
      local phrase = 'vc vix    r hn'
      local expected = 'exercism'
      local result = atbash_cipher.decode(phrase)
      assert.are.same(expected, result)
    end)

    it('decode with no spaces', function()
      local phrase = 'zmlyhgzxovrhlugvmzhgvkkrmthglmv'
      local expected = 'anobstacleisoftenasteppingstone'
      local result = atbash_cipher.decode(phrase)
      assert.are.same(expected, result)
    end)
  end)
end)
