local rational_numbers = require 'rational-numbers'

describe('rational-numbers', function()
  it('add two positive rational numbers', function()
    assert.are.same({ 7, 6 }, rational_numbers.add({ 1, 2 }, { 2, 3 }))
  end)

  it('add a positive rational number and a negative rational number', function()
    assert.are.same({ -1, 6 }, rational_numbers.add({ 1, 2 }, { -2, 3 }))
  end)

  it('add two negative rational numbers', function()
    assert.are.same({ -7, 6 }, rational_numbers.add({ -1, 2 }, { -2, 3 }))
  end)

  it('add a rational number to its additive inverse', function()
    assert.are.same({ 0, 1 }, rational_numbers.add({ 1, 2 }, { -1, 2 }))
  end)

  it('subtract two positive rational numbers', function()
    assert.are.same({ -1, 6 }, rational_numbers.subtract({ 1, 2 }, { 2, 3 }))
  end)

  it('subtract a positive rational number and a negative rational number', function()
    assert.are.same({ 7, 6 }, rational_numbers.subtract({ 1, 2 }, { -2, 3 }))
  end)

  it('subtract two negative rational numbers', function()
    assert.are.same({ 1, 6 }, rational_numbers.subtract({ -1, 2 }, { -2, 3 }))
  end)

  it('subtract a rational number from itself', function()
    assert.are.same({ 0, 1 }, rational_numbers.subtract({ 1, 2 }, { 1, 2 }))
  end)

  it('multiply two positive rational numbers', function()
    assert.are.same({ 1, 3 }, rational_numbers.multiply({ 1, 2 }, { 2, 3 }))
  end)

  it('multiply a negative rational number by a positive rational number', function()
    assert.are.same({ -1, 3 }, rational_numbers.multiply({ -1, 2 }, { 2, 3 }))
  end)

  it('multiply two negative rational numbers', function()
    assert.are.same({ 1, 3 }, rational_numbers.multiply({ -1, 2 }, { -2, 3 }))
  end)

  it('multiply a rational number by its reciprocal', function()
    assert.are.same({ 1, 1 }, rational_numbers.multiply({ 1, 2 }, { 2, 1 }))
  end)

  it('multiply a rational number by 1', function()
    assert.are.same({ 1, 2 }, rational_numbers.multiply({ 1, 2 }, { 1, 1 }))
  end)

  it('multiply a rational number by 0', function()
    assert.are.same({ 0, 1 }, rational_numbers.multiply({ 1, 2 }, { 0, 1 }))
  end)

  it('divide two positive rational numbers', function()
    assert.are.same({ 3, 4 }, rational_numbers.divide({ 1, 2 }, { 2, 3 }))
  end)

  it('divide a positive rational number by a negative rational number', function()
    assert.are.same({ -3, 4 }, rational_numbers.divide({ 1, 2 }, { -2, 3 }))
  end)

  it('divide two negative rational numbers', function()
    assert.are.same({ 3, 4 }, rational_numbers.divide({ -1, 2 }, { -2, 3 }))
  end)

  it('divide a rational number by 1', function()
    assert.are.same({ 1, 2 }, rational_numbers.divide({ 1, 2 }, { 1, 1 }))
  end)

  it('absolute value of a positive rational number', function()
    assert.are.same({ 1, 2 }, rational_numbers.abs({ 1, 2 }))
  end)

  it('absolute value of a positive rational number with negative numerator and denominator', function()
    assert.are.same({ 1, 2 }, rational_numbers.abs({ -1, -2 }))
  end)

  it('absolute value of a negative rational number', function()
    assert.are.same({ 1, 2 }, rational_numbers.abs({ -1, 2 }))
  end)

  it('absolute value of a negative rational number with negative denominator', function()
    assert.are.same({ 1, 2 }, rational_numbers.abs({ 1, -2 }))
  end)

  it('absolute value of zero', function()
    assert.are.same({ 0, 1 }, rational_numbers.abs({ 0, 1 }))
  end)

  -- it('raise a positive rational number to a positive integer power', function()
  --   assert.are.same({ 1, 8 }, rational_numbers.exp_rational({ 1, 2 }, 3))
  -- end)

  it('raise a negative rational number to a positive integer power', function()
    assert.are.same({ -1, 8 }, rational_numbers.exp_rational({ -1, 2 }, 3))
  end)

  it('raise zero to an integer power', function()
    assert.are.same({ 0, 1 }, rational_numbers.exp_rational({ 0, 1 }, 5))
  end)

  it('raise one to an integer power', function()
    assert.are.same({ 1, 1 }, rational_numbers.exp_rational({ 1, 1 }, 4))
  end)

  it('raise a positive rational number to the power of zero', function()
    assert.are.same({ 1, 1 }, rational_numbers.exp_rational({ 1, 2 }, 0))
  end)

  it('raise a negative rational number to the power of zero', function()
    assert.are.same({ 1, 1 }, rational_numbers.exp_rational({ -1, 2 }, 0))
  end)

  it('raise a real number to a positive rational number', function()
    assert.are.near(16.0, rational_numbers.exp_real(8, { 4, 3 }), 0.00001)
  end)

  it('raise a real number to a negative rational number', function()
    assert.are.near(0.3333333333333333, rational_numbers.exp_real(9, { -1, 2 }), 0.00001)
  end)

  it('raise a real number to a zero rational number', function()
    assert.are.near(1.0, rational_numbers.exp_real(2, { 0, 1 }), 0.00001)
  end)

  it('reduce a positive rational number to lowest terms', function()
    assert.are.same({ 1, 2 }, rational_numbers.reduce({ 2, 4 }))
  end)

  it('reduce a negative rational number to lowest terms', function()
    assert.are.same({ -2, 3 }, rational_numbers.reduce({ -4, 6 }))
  end)

  it('reduce a rational number with a negative denominator to lowest terms', function()
    assert.are.same({ -1, 3 }, rational_numbers.reduce({ 3, -9 }))
  end)

  it('reduce zero to lowest terms', function()
    assert.are.same({ 0, 1 }, rational_numbers.reduce({ 0, 6 }))
  end)

  it('reduce an integer to lowest terms', function()
    assert.are.same({ -2, 1 }, rational_numbers.reduce({ -14, 7 }))
  end)

  it('reduce one to lowest terms', function()
    assert.are.same({ 1, 1 }, rational_numbers.reduce({ 13, 13 }))
  end)
end)
