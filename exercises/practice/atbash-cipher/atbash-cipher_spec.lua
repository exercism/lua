local encode = require('atbash-cipher').encode

describe('atbash-cipher', function()
  it('should encode single letter plaintexts', function()
    assert.are.equal('m', encode('n'))
  end)

  it('should encode single-chunk plaintexts', function()
    assert.are.equal('svool', encode('hello'))
  end)

  it('should encode multi-chunk plaintexts', function()
    assert.are.equal('nrmwy oldrm tob', encode('mindblowingly'))
  end)

  it('should encode all letters as lower-case', function()
    assert.are.equal('svool', encode('HeLLo'))
  end)

  it('should not encode whitespace', function()
    assert.are.equal('svool', encode('h e l l o'))
  end)

  it('should not encode punctuation', function()
    assert.are.equal('svool', encode('h,e,l,l,o'))
  end)

  it('should not encode numbers', function()
    assert.are.equal('sv11l', encode('he11o'))
  end)

  it('should encode all letters', function()
    assert.are
      .equal('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt', encode('The quick brown fox jumps over the lazy dog.'))
  end)
end)
