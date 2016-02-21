local PhoneNumber = require('phone-number')

describe('phone-number', function()
  it('cleans the number (123) 456-7890', function()
    local phone = PhoneNumber:new('(123) 456-7890')
    assert.are.equals('1234567890', phone.number)
  end)

  it('cleans numbers with dots', function()
    local phone = PhoneNumber:new('123.456.7890')
    assert.are.equals('1234567890', phone.number)
  end)

  it('valid when 11 digits and first digit is 1', function()
    local phone = PhoneNumber:new('11234567890')
    assert.are.equals('1234567890', phone.number)
  end)

  it('invalid when 11 digits', function()
    local phone = PhoneNumber:new('21234567890')
    assert.are.equals('0000000000', phone.number)
  end)

  it('invalid when 9 digits', function()
    local phone = PhoneNumber:new('123456789')
    assert.are.equals('0000000000', phone.number)
  end)

  it('has an area code', function()
    local phone = PhoneNumber:new('1234567890')
    assert.are.equals('123', phone:areaCode())
  end)

  it('formats a number', function()
    local phone = PhoneNumber:new('1234567890')
    assert.are.equals('(123) 456-7890', tostring(phone))
  end)
end)
