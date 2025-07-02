local conjecture = require('collatz-conjecture')

describe('collatz-conjecture', function()
  it('zero steps for one', function()
    assert.are.equal(0, conjecture(1))
  end)

  it('divide if even', function()
    assert.are.equal(4, conjecture(16))
  end)

  it('even and odd steps', function()
    assert.are.equal(9, conjecture(12))
  end)

  it('large number of even and odd steps', function()
    assert.are.equal(152, conjecture(1000000))
  end)

  it('zero is an error', function()
    assert.has_error(function()
      conjecture(0)
    end)
  end)

  it('negative value is an error', function()
    assert.has_error(function()
      conjecture(-15)
    end)
  end)
end)
