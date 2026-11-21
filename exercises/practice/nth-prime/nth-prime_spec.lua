local nth = require('nth-prime')

describe('nth-prime', function()
  it('first prime', function()
    assert.equal(2, nth(1))
  end)

  it('second prime', function()
    assert.equal(3, nth(2))
  end)

  it('sixth prime', function()
    assert.equal(13, nth(6))
  end)

  it('big prime', function()
    assert.equal(104743, nth(10001))
  end)

  it('there is no zeroth prime', function()
    assert.has_error(function()
      nth(0)
    end)
  end)
end)
