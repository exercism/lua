local translate = require('pig-latin')

describe('pig-latin', function()
  describe('ay is added to words that start with vowels', function()
    it('word beginning with a', function()
      assert.equal('appleay', translate('apple'))
    end)

    it('word beginning with e', function()
      assert.equal('earay', translate('ear'))
    end)

    it('word beginning with i', function()
      assert.equal('iglooay', translate('igloo'))
    end)

    it('word beginning with o', function()
      assert.equal('objectay', translate('object'))
    end)

    it('word beginning with u', function()
      assert.equal('underay', translate('under'))
    end)

    it('word beginning with a vowel and followed by a qu', function()
      assert.equal('equalay', translate('equal'))
    end)
  end)

  describe('first letter and ay are moved to the end of words that start with consonants', function()
    it('word beginning with p', function()
      assert.equal('igpay', translate('pig'))
    end)

    it('word beginning with k', function()
      assert.equal('oalakay', translate('koala'))
    end)

    it('word beginning with x', function()
      assert.equal('enonxay', translate('xenon'))
    end)

    it('word beginning with q without a following u', function()
      assert.equal('atqay', translate('qat'))
    end)
  end)

  describe('some letter clusters are treated like a single consonant', function()
    it('word beginning with ch', function()
      assert.equal('airchay', translate('chair'))
    end)

    it('word beginning with qu', function()
      assert.equal('eenquay', translate('queen'))
    end)

    it('word beginning with qu and a preceding consonant', function()
      assert.equal('aresquay', translate('square'))
    end)

    it('word beginning with th', function()
      assert.equal('erapythay', translate('therapy'))
    end)

    it('word beginning with thr', function()
      assert.equal('ushthray', translate('thrush'))
    end)

    it('word beginning with sch', function()
      assert.equal('oolschay', translate('school'))
    end)
  end)

  describe('some letter clusters are treated like a single vowel', function()
    it('word beginning with yt', function()
      assert.equal('yttriaay', translate('yttria'))
    end)

    it('word beginning with xr', function()
      assert.equal('xrayay', translate('xray'))
    end)
  end)

  describe('position of y in a word determines if it is a consonant or a vowel', function()
    it('y is treated like a consonant at the beginning of a word', function()
      assert.equal('ellowyay', translate('yellow'))
    end)

    it('y is treated like a vowel at the end of a consonant cluster', function()
      assert.equal('ythmrhay', translate('rhythm'))
    end)

    it('y as second letter in two letter word', function()
      assert.equal('ymay', translate('my'))
    end)
  end)

  describe('phrases are translated', function()
    it('a whole phrase', function()
      assert.equal('ickquay astfay unray', translate('quick fast run'))
    end)
  end)
end)
