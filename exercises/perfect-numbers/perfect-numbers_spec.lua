local perfect_numbers = require('perfect-numbers')

describe('perfect-numbers', function()
  it('should be able to calculate the Aliquot sum of a number with no divisors', function()
    assert.equal(0, perfect_numbers.aliquot_sum(1))
  end)

  it('should be able to calculate the Aliquot sum of a number with a single divisor', function()
    assert.equal(1, perfect_numbers.aliquot_sum(2))
  end)

  it('should be able to calculate the Aliquot sum of a number with a multiple divisors', function()
    assert.equal(15, perfect_numbers.aliquot_sum(16))
  end)

  it('should be able to calculate the Aliquot sum of a large number', function()
    assert.equal(229, perfect_numbers.aliquot_sum(1115))
  end)

  it('should classify numbers whose Aliquot sum is less than itself as deficient', function()
    assert.equal('deficient', perfect_numbers.classify(13))
  end)

  it('should classify numbers whose Aliquot sum is equal to itself as perfect', function()
    assert.equal('perfect', perfect_numbers.classify(28))
  end)

  it('should classify numbers whose Aliquot sum is greater than itself as abundant', function()
    assert.equal('abundant', perfect_numbers.classify(12))
  end)
end)
