local raindrops = require('raindrops')

describe('raindrops', function()
  it('the sound for 1 is 1', function()
    assert.equal('1', raindrops(1))
  end)

  it('the sound for 3 is pling', function()
    assert.equal('Pling', raindrops(3))
  end)

  it('the sound for 5 is plang', function()
    assert.equal('Plang', raindrops(5))
  end)

  it('the sound for 7 is plong', function()
    assert.equal('Plong', raindrops(7))
  end)

  it('the sound for 6 is pling as it has a factor 3', function()
    assert.equal('Pling', raindrops(6))
  end)

  it('2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base', function()
    assert.equal('8', raindrops(8))
  end)

  it('the sound for 9 is pling as it has a factor 3', function()
    assert.equal('Pling', raindrops(9))
  end)

  it('the sound for 10 is plang as it has a factor 5', function()
    assert.equal('Plang', raindrops(10))
  end)

  it('the sound for 14 is plong as it has a factor of 7', function()
    assert.equal('Plong', raindrops(14))
  end)

  it('the sound for 15 is plingplang as it has factors 3 and 5', function()
    assert.equal('PlingPlang', raindrops(15))
  end)

  it('the sound for 21 is plingplong as it has factors 3 and 7', function()
    assert.equal('PlingPlong', raindrops(21))
  end)

  it('the sound for 25 is plang as it has a factor 5', function()
    assert.equal('Plang', raindrops(25))
  end)

  it('the sound for 27 is pling as it has a factor 3', function()
    assert.equal('Pling', raindrops(27))
  end)

  it('the sound for 35 is plangplong as it has factors 5 and 7', function()
    assert.equal('PlangPlong', raindrops(35))
  end)

  it('the sound for 49 is plong as it has a factor 7', function()
    assert.equal('Plong', raindrops(49))
  end)

  it('the sound for 52 is 52', function()
    assert.equal('52', raindrops(52))
  end)

  it('the sound for 105 is plingplangplong as it has factors 3, 5 and 7', function()
    assert.equal('PlingPlangPlong', raindrops(105))
  end)

  it('the sound for 3125 is plang as it has a factor 5', function()
    assert.equal('Plang', raindrops(3125))
  end)
end)
