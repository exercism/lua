local SpaceAge = require('./space-age')

describe('Space Age', function()

  it('age in seconds', function()
    local age = SpaceAge:new(1000000)
    assert.are.equal(1000000, age.seconds)
  end)

  it('age in Earth years', function()
    local age = SpaceAge:new(1000000000)
    assert.are.equal(31.69, age.onEarth())
  end)

  it('age in Mercury years', function()
    local age = SpaceAge:new(2134835688)
    assert.are.equal(67.65, age.onEarth())
    assert.are.equal(280.88, age.onMercury())
  end)

  it('age in Venus years', function()
    local age = SpaceAge:new(189839836)
    assert.are.equal(6.02, age.onEarth())
    assert.are.equal(9.78, age.onVenus())
  end)

  it('age in Mars years', function()
    local age = SpaceAge:new(2329871239)
    assert.are.equal(73.83, age.onEarth())
    assert.are.equal(39.25, age.onMars())
  end)

  it('age in Jupiter years', function()
    local age = SpaceAge:new(901876382)
    assert.are.equal(28.58, age.onEarth())
    assert.are.equal(2.41, age.onJupiter())
  end)

  it('age in Saturn years', function()
    local age = SpaceAge:new(3000000000)
    assert.are.equal(95.06, age.onEarth())
    assert.are.equal(3.23, age.onSaturn())
  end)

  it('age in Uranus years', function()
    local age = SpaceAge:new(3210123456)
    assert.are.equal(101.72, age.onEarth())
    assert.are.equal(1.21, age.onUranus())
  end)

  it('age in Neptune year', function()
    local age = SpaceAge:new(8210123456)
    assert.are.equal(260.16, age.onEarth())
    assert.are.equal(1.58, age.onNeptune())
  end)

end)
