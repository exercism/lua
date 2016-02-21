local prime_factors = require('prime-factors')

describe('prime-factors', function()
  it('returns an empty array for 1', function()
    assert.are.same({}, prime_factors(1))
  end)

  it('factors 2', function()
    assert.are.same({ 2 }, prime_factors(2))
  end)

  it('factors 3', function()
    assert.are.same({ 3 }, prime_factors(3))
  end)

  it('factors 4', function()
    assert.are.same({ 2, 2 }, prime_factors(4))
  end)

  it('factors 6', function()
    assert.are.same({ 2, 3 }, prime_factors(6))
  end)

  it('factors 8', function()
    assert.are.same({ 2, 2, 2 }, prime_factors(8))
  end)

  it('factors 9', function()
    assert.are.same({ 3, 3 }, prime_factors(9))
  end)

  it('factors 27', function()
    assert.are.same({ 3, 3, 3 }, prime_factors(27))
  end)

  it('factors 625', function()
    assert.are.same({ 5, 5, 5, 5 }, prime_factors(625))
  end)

  it('factors 901255', function()
    assert.are.same({ 5, 17, 23, 461 }, prime_factors(901255))
  end)

  it('factors 93819012551', function()
    assert.are.same({ 11, 9539, 894119 }, prime_factors(93819012551))
  end)
end)
