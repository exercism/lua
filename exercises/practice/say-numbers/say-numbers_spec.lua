local say = require('say-numbers')

describe('say-numbers', function()
  it('zero', function()
    assert.are.equal('zero', say(0))
  end)

  it('one', function()
    assert.are.equal('one', say(1))
  end)

  it('fourteen', function()
    assert.are.equal('fourteen', say(14))
  end)

  it('twenty', function()
    assert.are.equal('twenty', say(20))
  end)

  it('twenty-two', function()
    assert.are.equal('twenty-two', say(22))
  end)

  it('thirty', function()
    assert.are.equal('thirty', say(30))
  end)

  it('ninety-nine', function()
    assert.are.equal('ninety-nine', say(99))
  end)

  it('one hundred', function()
    assert.are.equal('one hundred', say(100))
  end)

  it('one hundred twenty-three', function()
    assert.are.equal('one hundred twenty-three', say(123))
  end)

  it('two hundred', function()
    assert.are.equal('two hundred', say(200))
  end)

  it('nine hundred ninety-nine', function()
    assert.are.equal('nine hundred ninety-nine', say(999))
  end)

  it('one thousand', function()
    assert.are.equal('one thousand', say(1000))
  end)

  it('one thousand two hundred thirty-four', function()
    assert.are.equal('one thousand two hundred thirty-four', say(1234))
  end)

  it('one million', function()
    assert.are.equal('one million', say(1000000))
  end)

  it('one million two thousand three hundred forty-five', function()
    assert.are.equal('one million two thousand three hundred forty-five', say(1002345))
  end)

  it('one billion', function()
    assert.are.equal('one billion', say(1000000000))
  end)

  it('a big number', function()
    assert.are.equal(
      'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three',
      say(987654321123))
  end)

  it('numbers below zero are out of range', function()
    assert.has_error(function()
      say(-1)
    end)
  end)

  it('numbers above 999,999,999,999 are out of range', function()
    assert.has_error(function()
      say(1000000000000)
    end)
  end)
end)
