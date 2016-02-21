local nth = require('nth-prime')

describe('nth-prime', function()
  local function benchmark(f)
    local start = os.clock()
    f()
    return os.clock() - start
  end

  it('should give 2 as the first prime', function()
    assert.equal(2, nth(1))
  end)

  it('should give 3 as the second prime', function()
    assert.equal(3, nth(2))
  end)

  it('should be able to calculate the nth prime for small n', function()
    assert.equal(13, nth(6))
  end)

  it('should be able to calculate the nth prime for large n', function()
    assert.equal(104743, nth(10001))
  end)

  it('should be efficient for large n', function()
    local execution_time = benchmark(function()
      nth(10001)
    end)

    assert(execution_time < 1, 'should take less than a second to execute')
  end)

  it('should raise an error for n <= 0', function()
    assert.has_error(function()
      nth(0)
    end)

    assert.has_error(function()
      nth(-1)
    end)
  end)
end)
