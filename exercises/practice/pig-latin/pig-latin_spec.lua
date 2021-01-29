local translate = require('pig-latin')

describe('pig-latin', function()
  it('should append "ay" to words beginning with a vowel', function()
    assert.equal('appleay', translate('apple'))
    assert.equal('earay', translate('ear'))
    assert.equal('iglooay', translate('igloo'))
    assert.equal('objectay', translate('object'))
    assert.equal('underay', translate('under'))
  end)

  it('should move the first letter plus "ay" to the end of words starting with a consonant', function()
    assert.equal('igpay', translate('pig'))
    assert.equal('oalakay', translate('koala'))
    assert.equal('ellowyay', translate('yellow'))
    assert.equal('enonxay', translate('xenon'))
    assert.equal('atqay', translate('qat'))
  end)

  it('should treat "ch" like a single consonant', function()
    assert.equal('airchay', translate('chair'))
  end)

  it('should treat "qu" like a single consonant', function()
    assert.equal('eenquay', translate('queen'))
  end)

  it('should treat a consonant plus "qu" like a single consonant', function()
    assert.equal('aresquay', translate('square'))
  end)

  it('should treat "th" like a single consonant', function()
    assert.equal('erapythay', translate('therapy'))
  end)

  it('should treat "thr" like a single consonant', function()
    assert.equal('ushthray', translate('thrush'))
  end)

  it('should treat "sch" like a single consonant', function()
    assert.equal('oolschay', translate('school'))
  end)

  it('should treat "yt" like a single vowel', function()
    assert.equal('yttriaay', translate('yttria'))
  end)

  it('should treat "xr" like a single vowel', function()
    assert.equal('xrayay', translate('xray'))
  end)

  it('should translate entire phrases', function()
    assert.equal('ickquay astfay unray', translate('quick fast run'))
  end)

  it('should ignore capitalization when translating', function()
    assert.equal('ickQuay aStFay Unray', translate('Quick FaSt rUn'))
  end)

  it('should retain punctuation in translated phrases', function()
    assert.equal('ellway, hatway avehay eway erehay?', translate('well, what have we here?'))
  end)

  it('should retain all whitespace', function()
    assert.equal('abstay\tanday   pacessay', translate('tabs\tand   spaces'))
  end)
end)
