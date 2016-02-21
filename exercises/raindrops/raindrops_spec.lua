local raindrops = require('raindrops')

describe('raindrops', function()
  it('should return the number as a string if it does not have 3, 5, or 7 as a prime factor', function()
    assert.equal('1', raindrops(1))
    assert.equal('2', raindrops(2))
    assert.equal('52', raindrops(52))
  end)

  it('should return "Pling" if the number has 3 as a prime factor', function()
    assert.equal('Pling', raindrops(3))
    assert.equal('Pling', raindrops(6))
    assert.equal('Pling', raindrops(9))
  end)

  it('should return "Plang" if the number has 5 as a prime factor', function()
    assert.equal('Plang', raindrops(5))
    assert.equal('Plang', raindrops(10))
    assert.equal('Plang', raindrops(25))
  end)

  it('should return "Plong" if the number has 7 as a prime factor', function()
    assert.equal('Plong', raindrops(7))
    assert.equal('Plong', raindrops(14))
    assert.equal('Plong', raindrops(49))
  end)

  it('should return "PlingPlang" if the number has both 3 and 5 as a prime factors', function()
    assert.equal('PlingPlang', raindrops(15))
  end)

  it('should return "PlingPlong" if the number has both 3 and 7 as a prime factors', function()
    assert.equal('PlingPlong', raindrops(21))
  end)

  it('should return "PlangPlong" if the number has both 5 and 7 as a prime factors', function()
    assert.equal('PlangPlong', raindrops(35))
  end)

  it('should return "PlingPlangPlong" if the number has 3, 5, and 7 as a prime factors', function()
    assert.equal('PlingPlangPlong', raindrops(105))
  end)
end)
