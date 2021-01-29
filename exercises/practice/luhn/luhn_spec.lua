local luhn = require('luhn')

describe('luhn', function()
  it('should indicate that single digits are invalid', function()
    assert.equal(false, luhn.valid('1'))
    assert.equal(false, luhn.valid('0'))
  end)

  it('should check a valid Canadian SIN', function()
    assert.equal(true, luhn.valid('046 454 286'))
  end)

  it('should check an invalid Canadian SIN', function()
    assert.equal(false, luhn.valid('046 454 287'))
  end)

  it('should check an invalid credit card', function()
    assert.equal(false, luhn.valid('8273 1232 7352 0569'))
  end)

  it('should not allow non-digits', function()
    assert.equal(false, luhn.valid('a46 454 286'))
  end)
end)
