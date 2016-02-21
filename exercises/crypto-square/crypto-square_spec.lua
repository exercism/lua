local cs = require('crypto-square')

describe('crypto-square', function()
  describe('normalized_plaintext', function()
    it('should convert all uppercase letters to lowercase', function()
      assert.equal('abcdefg', cs.normalized_plaintext('AbcDEfG'))
    end)

    it('should remove all whitespace', function()
      assert.equal('helloworld', cs.normalized_plaintext([[he ll o
        wor l d ]]))
    end)

    it('should remove all punctuation and special characters', function()
      assert.equal('helloworld', cs.normalized_plaintext('[{h|e!l@?><l.,o;}]w:"\'\\/o.+%-=rld@`~'))
    end)

    it('should retain numbers', function()
      assert.equal('hello123', cs.normalized_plaintext('hello123'))
    end)
  end)

  describe('size', function()
    it('should determine the size of a small perfect square', function()
      assert.equal(2, cs.size('1234'))
    end)

    it('should determine the size of a larger perfect square', function()
      assert.equal(3, cs.size('123456789'))
    end)

    it('should determine the size of a non-perfect square', function()
      assert.equal(4, cs.size('123456789abc'))
    end)

    it('should determine the size based on normalized plaintext', function()
      assert.equal(4, cs.size('Oh hey, this is nuts!'))
    end)
  end)

  describe('segments', function()
    it('should split plaintext into segments of size', function()
      assert.same(
        { 'neverv', 'exthin', 'eheart', 'withid', 'lewoes' },
        cs.segments('never vex thine heart with idle woes')
      )
    end)

    it('should split normalized plaintext', function()
      assert.same(
        { 'zomg', 'zomb', 'ies' },
        cs.segments('ZOMG! ZOMBIES!!!')
      )
    end)
  end)

  describe('ciphertext', function()
    it('should generate ciphertext for a string', function()
      assert.equal(
        'wneiaweoreneawssciliprerlneoidktcms',
        cs.ciphertext('we all know interspecies romance is weird')
      )
    end)

    it('should normalize a string when generating ciphertext', function()
      assert.equal(
        'tasneyinicdsmiohooelntuillibsuuml',
        cs.ciphertext('Time is an illusion. Lunchtime doubly so.')
      )
    end)
  end)

  describe('normalized_ciphertext', function()
    it('should generate normalized ciphertext', function()
      assert.equal(
        'vrel aepe mset paoo irpo',
        cs.normalized_ciphertext('Vampires are people too!')
      )
    end)

    it('should generate normalized ciphertext with a short segment', function()
      assert.equal(
        'msemo aanin dnin ndla etlt shui',
        cs.normalized_ciphertext('Madness, and then illumination.')
      )
    end)

    it('should generate normalized ciphertext when just less than a full square', function()
      assert.equal('im a', cs.normalized_ciphertext('I am'))
    end)
  end)
end)
