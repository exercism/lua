-- Workaround for the fact busted has a built-in called 'say'
local say = loadfile 'say.lua'()

describe('say', function()
  it('should say 0', function()
    assert.are.equal('zero', say(0))
  end)

  it('should say 1', function()
    assert.are.equal('one', say(1))
  end)

  it('should say 14', function()
    assert.are.equal('fourteen', say(14))
  end)

  it('should say 20', function()
    assert.are.equal('twenty', say(20))
  end)

  it('should say 22', function()
    assert.are.equal('twenty-two', say(22))
  end)

  it('should say 100', function()
    assert.are.equal('one hundred', say(100))
  end)

  it('should say 123', function()
    assert.are.equal('one hundred twenty-three', say(123))
  end)

  it('should say 1,000', function()
    assert.are.equal('one thousand', say(1000))
  end)

  it('should say 1,234', function()
    assert.are.equal('one thousand two hundred thirty-four', say(1234))
  end)

  it('should say 1,000,000', function()
    assert.are.equal('one million', say(1000000))
  end)

  it('should say 1,002,345', function()
    assert.are.equal('one million two thousand three hundred forty-five', say(1002345))
  end)

  it('should say 1,000,000,000', function()
    assert.are.equal('one billion', say(1000000000))
  end)

  it('should say very large numbers', function()
    assert.are.equal(
      'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three',
      say(987654321123)
    )
  end)

  it('should say all ones', function()
    assert.are.equal('one', say(1))
    assert.are.equal('two', say(2))
    assert.are.equal('three', say(3))
    assert.are.equal('four', say(4))
    assert.are.equal('five', say(5))
    assert.are.equal('six', say(6))
    assert.are.equal('seven', say(7))
    assert.are.equal('eight', say(8))
    assert.are.equal('nine', say(9))
  end)

  it('should say all teens', function()
    assert.are.equal('ten', say(10))
    assert.are.equal('eleven', say(11))
    assert.are.equal('twelve', say(12))
    assert.are.equal('thirteen', say(13))
    assert.are.equal('fourteen', say(14))
    assert.are.equal('fifteen', say(15))
    assert.are.equal('sixteen', say(16))
    assert.are.equal('seventeen', say(17))
    assert.are.equal('eighteen', say(18))
    assert.are.equal('nineteen', say(19))
  end)

  it('should say all tens', function()
    assert.are.equal('twenty', say(20))
    assert.are.equal('thirty', say(30))
    assert.are.equal('forty', say(40))
    assert.are.equal('fifty', say(50))
    assert.are.equal('sixty', say(60))
    assert.are.equal('seventy', say(70))
    assert.are.equal('eighty', say(80))
    assert.are.equal('ninety', say(90))
  end)

  it('should not say negative numbers', function()
    assert.are.equal(-1, say(-1))
    assert.are.equal(-1, say(-5))
  end)

  it('should not say numbers above 999,999,999,999', function()
    assert.are.equal(-1, say(1000000000000))
    assert.are.equal(-1, say(1000000000005))
  end)
end)
