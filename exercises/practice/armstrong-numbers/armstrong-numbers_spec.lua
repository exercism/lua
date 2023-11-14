local ArmstrongNumbers = require 'armstrong-numbers'

describe('armstrong-nunbers', function()
  it('Zero is an Armstrong number', function()
    assert.is_true(ArmstrongNumbers.isArmstrongNumber(0))
  end)

  it('Single-digit numbers are Armstrong numbers', function()
    assert.is_true(ArmstrongNumbers.isArmstrongNumber(5))
  end)

  it('There are no two-digit Armstrong numbers', function()
    assert.is_false(ArmstrongNumbers.isArmstrongNumber(10))
  end)

  it('Three-digit number that is an Armstrong number', function()
    assert.is_true(ArmstrongNumbers.isArmstrongNumber(153))
  end)

  it('Three-digit number that is not an Armstrong number', function()
    assert.is_false(ArmstrongNumbers.isArmstrongNumber(100))
  end)

  it('Four-digit number that is an Armstrong number', function()
    assert.is_true(ArmstrongNumbers.isArmstrongNumber(9474))
  end)

  it('Four-digit number that is not an Armstrong number', function()
    assert.is_false(ArmstrongNumbers.isArmstrongNumber(9475))
  end)

  it('Seven-digit number that is an Armstrong number', function()
    assert.is_true(ArmstrongNumbers.isArmstrongNumber(9926315))
  end)

  it('Seven-digit number that is not an Armstrong number', function()
    assert.is_false(ArmstrongNumbers.isArmstrongNumber(9926314))
  end)
end)
