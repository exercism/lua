local roman_numerals = require('roman-numerals')

describe('roman-numerals', function()
  it('1 is i', function()
    assert.are.equal('I', roman_numerals.to_roman(1))
  end)

  it('2 is ii', function()
    assert.are.equal('II', roman_numerals.to_roman(2))
  end)

  it('3 is iii', function()
    assert.are.equal('III', roman_numerals.to_roman(3))
  end)

  it('4 is iv', function()
    assert.are.equal('IV', roman_numerals.to_roman(4))
  end)

  it('5 is v', function()
    assert.are.equal('V', roman_numerals.to_roman(5))
  end)

  it('6 is vi', function()
    assert.are.equal('VI', roman_numerals.to_roman(6))
  end)

  it('9 is ix', function()
    assert.are.equal('IX', roman_numerals.to_roman(9))
  end)

  it('16 is xvi', function()
    assert.are.equal('XVI', roman_numerals.to_roman(16))
  end)

  it('27 is xxvii', function()
    assert.are.equal('XXVII', roman_numerals.to_roman(27))
  end)

  it('48 is xlviii', function()
    assert.are.equal('XLVIII', roman_numerals.to_roman(48))
  end)

  it('49 is xlix', function()
    assert.are.equal('XLIX', roman_numerals.to_roman(49))
  end)

  it('59 is lix', function()
    assert.are.equal('LIX', roman_numerals.to_roman(59))
  end)

  it('66 is lxvi', function()
    assert.are.equal('LXVI', roman_numerals.to_roman(66))
  end)

  it('93 is xciii', function()
    assert.are.equal('XCIII', roman_numerals.to_roman(93))
  end)

  it('141 is cxli', function()
    assert.are.equal('CXLI', roman_numerals.to_roman(141))
  end)

  it('163 is clxiii', function()
    assert.are.equal('CLXIII', roman_numerals.to_roman(163))
  end)

  it('166 is clxvi', function()
    assert.are.equal('CLXVI', roman_numerals.to_roman(166))
  end)

  it('402 is cdii', function()
    assert.are.equal('CDII', roman_numerals.to_roman(402))
  end)

  it('575 is dlxxv', function()
    assert.are.equal('DLXXV', roman_numerals.to_roman(575))
  end)

  it('666 is dclxvi', function()
    assert.are.equal('DCLXVI', roman_numerals.to_roman(666))
  end)

  it('911 is cmxi', function()
    assert.are.equal('CMXI', roman_numerals.to_roman(911))
  end)

  it('1024 is mxxiv', function()
    assert.are.equal('MXXIV', roman_numerals.to_roman(1024))
  end)

  it('1666 is mdclxvi', function()
    assert.are.equal('MDCLXVI', roman_numerals.to_roman(1666))
  end)

  it('3000 is mmm', function()
    assert.are.equal('MMM', roman_numerals.to_roman(3000))
  end)

  it('3001 is mmmi', function()
    assert.are.equal('MMMI', roman_numerals.to_roman(3001))
  end)

  it('3888 is mmmdccclxxxviii', function()
    assert.are.equal('MMMDCCCLXXXVIII', roman_numerals.to_roman(3888))
  end)

  it('3999 is mmmcmxcix', function()
    assert.are.equal('MMMCMXCIX', roman_numerals.to_roman(3999))
  end)
end)
