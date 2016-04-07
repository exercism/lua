local binary = require('binary')

describe('binary', function()
  it('1 is decimal 1', function()
    local expected = 1
    local actual = binary.to_decimal('1')
    assert.are.equal(expected, actual)
  end)

  it('10 is decimal 2', function()
    local expected = 2
    local actual = binary.to_decimal('10')
    assert.are.equal(expected, actual)
  end)

  it('11 is decimal 3', function()
    local expected = 3
    local actual = binary.to_decimal('11')
    assert.are.equal(expected, actual)
  end)

  it('100 is decimal 4', function()
    local expected = 4
    local actual = binary.to_decimal('100')
    assert.are.equal(expected, actual)
  end)

  it('1001 is decimal 9', function()
    local expected = 9
    local actual = binary.to_decimal('1001')
    assert.are.equal(expected, actual)
  end)

  it('11010 is decimal 26', function()
    local expected = 26
    local actual = binary.to_decimal('11010')
    assert.are.equal(expected, actual)
  end)

  it('10001101000 is decimal 1128', function()
    local expected = 1128
    local actual = binary.to_decimal('10001101000')
    assert.are.equal(expected, actual)
  end)

  it('should return 0 if alphabetic characters are included at the beginning of a valid binary number', function()
    local expected = 0
    local actual = binary.to_decimal('carrot1101')
    assert.are.equal(expected, actual)
  end)

  it('should return 0 if alphabetic characters are included at the end of a valid binary number', function()
    local expected = 0
    local actual = binary.to_decimal('0110carrot')
    assert.are.equal(expected, actual)
  end)

  it('should return 0 if alphabetic characters are included in the middle of a valid binary number', function()
    local expected = 0
    local actual = binary.to_decimal('01carrot01')
    assert.are.equal(expected, actual)
  end)
end)
