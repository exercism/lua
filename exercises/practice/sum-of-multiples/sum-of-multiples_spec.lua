local sum_of_multiples = require('sum-of-multiples')

describe('sum-of-multiples', function()
  it('should sum multiples of a single number', function()
    assert.same(9, sum_of_multiples({ 3 }).to(7))
    assert.same(15, sum_of_multiples({ 5 }).to(12))
  end)

  it('should sum multiples of a list of numbers', function()
    assert.same(33, sum_of_multiples({ 3, 5 }).to(11))
    assert.same(129, sum_of_multiples({ 7, 3 }).to(25))
    assert.same(153, sum_of_multiples({ 7, 3, 8 }).to(25))
  end)

  it('should calculate multiples up to, but not including, the limit', function()
    assert.same(9, sum_of_multiples({ 3 }).to(9))
    assert.same(23, sum_of_multiples({ 3, 5 }).to(10))
  end)

  it('should not include a multiple more than once', function()
    assert.same(35, sum_of_multiples({ 2, 5 }).to(11))
    assert.same(sum_of_multiples({ 2 }).to(11), sum_of_multiples({ 2, 4 }).to(11))
  end)
end)
