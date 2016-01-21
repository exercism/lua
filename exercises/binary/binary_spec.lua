local Binary = require('binary')

describe('binary', function() 

  it('1 is decimal 1', function()
    local expected = 1
    local result = Binary.toDecimal('1')
    assert.are.equals(expected, result)
  end)

  it('10 is decimal 2', function()
    local expected = 2
    local result = Binary.toDecimal('10')
    assert.are.equals(expected, result)
  end)

  it('11 is decimal 3', function()
    local expected = 3
    local result = Binary.toDecimal('11')
    assert.are.equals(expected, result)
  end)

  it('100 is decimal 4', function()
    local expected = 4
    local result = Binary.toDecimal('100')
    assert.are.equals(expected, result)
  end)

  it('1001 is decimal 9', function()
    local expected = 9
    local result = Binary.toDecimal('1001')
    assert.are.equals(expected, result)
  end)

  it('11010 is decimal 26', function()
    local expected = 26
    local result = Binary.toDecimal('11010')
    assert.are.equals(expected, result)
  end)

  it('10001101000 is decimal 1128', function()
    local expected = 1128
    local result = Binary.toDecimal('10001101000')
    assert.are.equals(expected, result)
  end)

  it('carrot is decimal 0', function()
    local expected = 0
    local result = Binary.toDecimal('carrot')
    assert.are.equals(expected, result)
  end)

end)

