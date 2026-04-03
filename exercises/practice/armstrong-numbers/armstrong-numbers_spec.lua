local ArmstrongNumbers = require('armstrong-numbers')

describe('armstrong-numbers', function()
  it('zero is an armstrong number', function()
    assert.is_true(ArmstrongNumbers.is_armstrong_number(0))
  end)

  it('single-digit numbers are armstrong numbers', function()
    assert.is_true(ArmstrongNumbers.is_armstrong_number(5))
  end)

  it('there are no two-digit armstrong numbers', function()
    assert.is_false(ArmstrongNumbers.is_armstrong_number(10))
  end)

  it('three-digit number that is an armstrong number', function()
    assert.is_true(ArmstrongNumbers.is_armstrong_number(153))
  end)

  it('three-digit number that is not an armstrong number', function()
    assert.is_false(ArmstrongNumbers.is_armstrong_number(100))
  end)

  it('four-digit number that is an armstrong number', function()
    assert.is_true(ArmstrongNumbers.is_armstrong_number(9474))
  end)

  it('four-digit number that is not an armstrong number', function()
    assert.is_false(ArmstrongNumbers.is_armstrong_number(9475))
  end)

  it('seven-digit number that is an armstrong number', function()
    assert.is_true(ArmstrongNumbers.is_armstrong_number(9926315))
  end)

  it('seven-digit number that is not an armstrong number', function()
    assert.is_false(ArmstrongNumbers.is_armstrong_number(9926314))
  end)
end)
