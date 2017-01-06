local rle = require('run-length-encoding')

describe('run-length-encoding', function()
  it('should encode simple strings', function()
    assert.equal('2A3B4C', rle.encode('AABBBCCCC'))
  end)

  it('should encode strings with multi-digit run lengths', function()
    assert.equal('2A10B4C', rle.encode('AABBBBBBBBBBCCCC'))
  end)

  it('should decode simple strings', function()
    assert.equal('AABBBCCCC', rle.decode('2A3B4C'))
  end)

  it('should decode strings with multi-digit run lengths', function()
    assert.equal('AABBBBBBBBBBCCCC', rle.decode('2A10B4C'))
  end)

  it('should not encode characters with a run length of 1', function()
    assert.equal('2AB4CD', rle.encode('AABCCCCD'))
  end)

  it('should successfully decode characters with a run length of 1', function()
    assert.equal('AABCCCCD', rle.decode('2AB4CD'))
  end)

  it('should decode an encoded string back to the original string', function()
    assert.equal('zzz ZZ  zZ', rle.decode(rle.encode('zzz ZZ  zZ')))
  end)
end)
