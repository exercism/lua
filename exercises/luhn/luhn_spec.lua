local Luhn = require('luhn')

describe('luhn', function()

  it('should give the last digit of a number as the check digit', function()
    assert.equal(7, Luhn.new('34567'):check_digit())
    assert.equal(0, Luhn.new('91370'):check_digit())
  end)

  it('should determine the addends of a value', function()
    local luhn = Luhn.new('12121')
    assert.same({ 1, 4, 1, 4, 1 }, luhn:addends())
  end)

  it('should subtract 9 from any addends >9', function()
    local luhn = Luhn.new('8631')
    assert.same({ 7, 6, 6, 1 }, luhn:addends())
  end)

  it('should calculate the checksum of a number by summing the addends', function()
    assert.equal(22, Luhn.new('4913'):checksum())
    assert.equal(21, Luhn.new('201773'):checksum())
  end)

  it('should indicate that a number with a checksum indivisible by 0 is not valid', function()
    local luhn = Luhn.new('738')
    assert.equal(false, luhn:valid())
  end)

  it('should indicate that a number with a checksum divisible by 0 is valid', function()
    local luhn = Luhn.new('8739567')
    assert.equal(true, luhn:valid())
  end)

  it('should create valid numbers by appending the correct check digit', function()
    assert.equal('1230', Luhn.create('123'))
    assert.equal('8739567', Luhn.create('873956'))
    assert.equal('8372637564', Luhn.create('837263756'))
  end)

  it('should support extremely large input', function()
    local luhn = Luhn.new('34598754109846124372104312349048732432143214732140498237142')
    assert.equal(2, luhn:check_digit())
    assert.equal(268, luhn:checksum())
    assert.equal(false, luhn:valid())

    assert.equal(
      '345987541098461243721043123490487324321432147321404982371420',
      Luhn.create('34598754109846124372104312349048732432143214732140498237142')
    )
  end)

end)
