local to_roman = require('roman-numerals').to_roman

describe('roman-numerals', function()
  it('converts 1', function()
    assert.are.equal('I', to_roman(1))
  end)

  it('converts 2', function()
    assert.are.equal('II', to_roman(2))
  end)

  it('converts 3', function()
    assert.are.equal('III', to_roman(3))
  end)

  it('converts 4', function()
    assert.are.equal('IV', to_roman(4))
  end)

  it('converts 5', function()
    assert.are.equal('V', to_roman(5))
  end)

  it('converts 6', function()
    assert.are.equal('VI', to_roman(6))
  end)

  it('converts 9', function()
    assert.are.equal('IX', to_roman(9))
  end)

  it('converts 16', function()
    assert.are.equal('XVI', to_roman(16))
  end)

  it('converts 27', function()
    assert.are.equal('XXVII', to_roman(27))
  end)

  it('converts 48', function()
    assert.are.equal('XLVIII', to_roman(48))
  end)

  it('converts 59', function()
    assert.are.equal('LIX', to_roman(59))
  end)

  it('converts 66', function()
    assert.are.equal('LXVI', to_roman(66))
  end)

  it('converts 93', function()
    assert.are.equal('XCIII', to_roman(93))
  end)

  it('converts 141', function()
    assert.are.equal('CXLI', to_roman(141))
  end)

  it('converts 163', function()
    assert.are.equal('CLXIII', to_roman(163))
  end)

  it('converts 166', function()
    assert.are.equal('CLXVI', to_roman(166))
  end)

  it('converts 402', function()
    assert.are.equal('CDII', to_roman(402))
  end)

  it('converts 575', function()
    assert.are.equal('DLXXV', to_roman(575))
  end)

  it('converts 666', function()
    assert.are.equal('DCLXVI', to_roman(666))
  end)

  it('converts 911', function()
    assert.are.equal('CMXI', to_roman(911))
  end)

  it('converts 1024', function()
    assert.are.equal('MXXIV', to_roman(1024))
  end)

  it('converts 1666', function()
    assert.are.equal('MDCLXVI', to_roman(1666))
  end)

  it('converts 3000', function()
    assert.are.equal('MMM', to_roman(3000))
  end)

  it('converts 3001', function()
    assert.are.equal('MMMI', to_roman(3001))
  end)

  it('converts 3999', function()
    assert.are.equal('MMMCMXCIX', to_roman(3999))
  end)
end)
