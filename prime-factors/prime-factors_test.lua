local primeFactors = require('prime-factors')

describe('primeFactors', function() 

  it('returns an empty array for 1', function() 
    assert.are.same({},PrimeFactors(1))
  end)

  it('factors 2', function()
    assert.are.same({2},PrimeFactors(2))
  end)

  it('factors 3', function()
    assert.are.same({3},PrimeFactors(3))
  end)

  it('factors 4', function()
    assert.are.same({2, 2},PrimeFactors(4))
  end)

  it('factors 6', function()
    assert.are.same({2, 3},PrimeFactors(6))
  end)

  it('factors 8', function()
    assert.are.same({2, 2, 2},PrimeFactors(8))
  end)

  it('factors 9', function()
    assert.are.same({3, 3},PrimeFactors(9))
  end)

  it('factors 27', function()
    assert.are.same({3, 3, 3},PrimeFactors(27))
  end)

  it('factors 625', function()
    assert.are.same({5, 5, 5, 5},PrimeFactors(625))
  end)

  it('factors 901255', function()
    assert.are.same({5, 17, 23, 461},PrimeFactors(901255))
  end)

  it('factors 93819012551', function()
    assert.are.same({11, 9539, 894119},PrimeFactors(93819012551))
  end)

end)
