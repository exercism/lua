local Octal = require('./octal')

describe('octal', function()
  it('should convert 1 to decimal 1', function()
    assert.equal(1, Octal('1').to_decimal())
  end)

  it('should convert 10 to decimal 8', function()
    assert.equal(8, Octal('10').to_decimal())
  end)

  it('should convert 17 to decimal 15', function()
    assert.equal(15, Octal('17').to_decimal())
  end)

  it('should convert 11 to decimal 9', function()
    assert.equal(9, Octal('11').to_decimal())
  end)

  it('should convert 130 to decimal 88', function()
    assert.equal(88, Octal('130').to_decimal())
  end)

  it('should convert 2047 to decimal 1063', function()
    assert.equal(1063, Octal('2047').to_decimal())
  end)

  it('should convert 7777 to decimal 4095', function()
    assert.equal(4095, Octal('7777').to_decimal())
  end)

  it('should convert 1234567 to decimal 342391', function()
    assert.equal(342391, Octal('1234567').to_decimal())
  end)

  it('should return 0 when the octal string contains invalid characters', function()
    assert.equal(0, Octal('carrot').to_decimal())
    assert.equal(0, Octal('123z456').to_decimal())
  end)

  it('should return 0 when the octal string contains invalid digits', function()
    assert.equal(0, Octal('8').to_decimal())
    assert.equal(0, Octal('9').to_decimal())
  end)
end)
