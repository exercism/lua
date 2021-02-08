local raindrops = require('raindrops')

describe('raindrops', function()
  it('the sound for 1 is 1', function()
    assert.equal('1', raindrops(1))
  end)

  it('the sound for 3 is Pling', function()
    assert.equal('Pling', raindrops(3))
  end)

  it('the sound for 5 is Plang', function()
    assert.equal('Plang', raindrops(5))
  end)

  it('the sound for 7 is Plong', function()
    assert.equal('Plong', raindrops(7))
  end)

  it('the sound for 6 is Pling as it has a factor 3', function()
    assert.equal('Pling', raindrops(6))
  end)

  it('2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base', function()
    assert.equal('8', raindrops(8))
  end)

  it('the sound for 9 is Pling as it has a factor 3', function()
    assert.equal('Pling', raindrops(9))
  end)

  it('the sound for 10 is Plang as it has a factor 5', function()
    assert.equal('Plang', raindrops(10))
  end)

  it('the sound for 14 is Plong as it has a factor 7', function()
    assert.equal('Plong', raindrops(14))
  end)

  it('the sound for 15 is PlingPlang as it has a factor 3 and 5', function()
    assert.equal('PlingPlang', raindrops(15))
  end)

  it('the sound for 21 is PlingPlong as it has factors 3 and 7', function()
    assert.equal('PlingPlong', raindrops(21))
  end)

  it('the sound for 25 is Plang as it has a factor 5', function()
    assert.equal('Plang', raindrops(25))
  end)

  it('the sound for 27 is Pling as it has a factor 3', function()
    assert.equal('Pling', raindrops(27))
  end)

  it('the sound for 35 is PlangPlong as it has factors 5 and 7', function()
    assert.equal('PlangPlong', raindrops(35))
  end)

  it('the sound for 49 is Plong as it has a factor 7', function()
    assert.equal('Plong', raindrops(49))
  end)

  it('the sound for 52 is 52', function()
    assert.equal('52', raindrops(52))
  end)

  it('the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7', function()
    assert.equal('PlingPlangPlong', raindrops(105))
  end)

  it('the sound for 3125 is Plang as it has a factor 5', function()
    assert.equal('Plang', raindrops(3125))
  end)
end)
