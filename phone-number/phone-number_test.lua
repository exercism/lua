local PhoneNumber = require('phone-number')

describe("PhoneNumber()", function() 
  it("cleans the number (123) 456-7890", function() 
    local phone = PhoneNumber:new("(123) 456-7890")
    assert.are.equals(phone.number,"1234567890")
  end)

  it("cleans numbers with dots", function()
    local phone = PhoneNumber:new("123.456.7890")
    assert.are.equals(phone.number,"1234567890")
  end)

  it("valid when 11 digits and first digit is 1", function()
    local phone = PhoneNumber:new("11234567890")
    assert.are.equals(phone.number,"1234567890")
  end)

  it("invalid when 11 digits", function()
    local phone = PhoneNumber:new("21234567890")
    assert.are.equals(phone.number,"0000000000")
  end)

  it("invalid when 9 digits", function()
    local phone = PhoneNumber:new("123456789")
    assert.are.equals(phone.number,"0000000000")
  end)

  it("has an area code", function()
    local phone = PhoneNumber:new("1234567890")
    assert.are.equals(phone:areaCode(),"123")
  end)

  it("formats a number", function()
    local phone = PhoneNumber:new("1234567890")
    assert.are.equals(phone:toString(),"(123) 456-7890")
  end)
end)
