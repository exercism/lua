local sum_of_multiples = require('sum-of-multiples')

describe('sum-of-multiples', function()
  it('no multiples within limit', function()
    assert.equal(0, sum_of_multiples({ 3, 5 }).to(1))
  end)

  it('one factor has multiples within limit', function()
    assert.equal(3, sum_of_multiples({ 3, 5 }).to(4))
  end)

  it('more than one multiple within limit', function()
    assert.equal(9, sum_of_multiples({ 3 }).to(7))
  end)

  it('more than one factor with multiples within limit', function()
    assert.equal(23, sum_of_multiples({ 3, 5 }).to(10))
  end)

  it('each multiple is only counted once', function()
    assert.equal(2318, sum_of_multiples({ 3, 5 }).to(100))
  end)

  it('a much larger limit', function()
    assert.equal(233168, sum_of_multiples({ 3, 5 }).to(1000))
  end)

  it('three factors', function()
    assert.equal(51, sum_of_multiples({ 7, 13, 17 }).to(20))
  end)

  it('factors not relatively prime', function()
    assert.equal(30, sum_of_multiples({ 4, 6 }).to(15))
  end)

  it('some pairs of factors relatively prime and some not', function()
    assert.equal(4419, sum_of_multiples({ 5, 6, 8 }).to(150))
  end)

  it('one factor is a multiple of another', function()
    assert.equal(275, sum_of_multiples({ 5, 25 }).to(51))
  end)

  it('much larger factors', function()
    assert.equal(2203160, sum_of_multiples({ 43, 47 }).to(10000))
  end)

  it('all numbers are multiples of 1', function()
    assert.equal(4950, sum_of_multiples({ 1 }).to(100))
  end)

  it('no factors means an empty sum', function()
    assert.equal(0, sum_of_multiples({}).to(10000))
  end)

  it('the only multiple of 0 is 0', function()
    assert.equal(0, sum_of_multiples({ 0 }).to(1))
  end)

  it('the factor 0 does not affect the sum of multiples of other factors', function()
    assert.equal(3, sum_of_multiples({ 3, 0 }).to(4))
  end)

  it('solutions using include-exclude must extend to cardinality greater than 3', function()
    assert.equal(39614537, sum_of_multiples({ 2, 3, 5, 7, 11 }).to(10000))
  end)
end)
