local prime_factors = require('prime-factors')

describe('prime-factors', function()
  it('no factors', function()
    assert.are.same({}, prime_factors(1))
  end)

  it('prime number', function()
    assert.are.same({ 2 }, prime_factors(2))
  end)

  it('another prime number', function()
    assert.are.same({ 3 }, prime_factors(3))
  end)

  it('square of a prime', function()
    assert.are.same({ 3, 3 }, prime_factors(9))
  end)

  it('product of first prime', function()
    assert.are.same({ 2, 2 }, prime_factors(4))
  end)

  it('cube of a prime', function()
    assert.are.same({ 2, 2, 2 }, prime_factors(8))
  end)

  it('product of second prime', function()
    assert.are.same({ 3, 3, 3 }, prime_factors(27))
  end)

  it('product of third prime', function()
    assert.are.same({ 5, 5, 5, 5 }, prime_factors(625))
  end)

  it('product of first and second prime', function()
    assert.are.same({ 2, 3 }, prime_factors(6))
  end)

  it('product of primes and non-primes', function()
    assert.are.same({ 2, 2, 3 }, prime_factors(12))
  end)

  it('product of primes', function()
    assert.are.same({ 5, 17, 23, 461 }, prime_factors(901255))
  end)

  it('factors include a large prime', function()
    assert.are.same({ 11, 9539, 894119 }, prime_factors(93819012551))
  end)
end)
