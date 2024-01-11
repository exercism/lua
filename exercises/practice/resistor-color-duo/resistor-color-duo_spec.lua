local rcd = require 'resistor-color-duo'

describe('resistor-color-duo', function()
  it('Brown and black', function()
    assert.equal(10, rcd.value({ 'brown', 'black' }))
  end)

  it('Blue and grey', function()
    assert.equal(68, rcd.value({ 'blue', 'grey' }))
  end)

  it('Yellow and violet', function()
    assert.equal(47, rcd.value({ 'yellow', 'violet' }))
  end)

  it('White and red', function()
    assert.equal(92, rcd.value({ 'white', 'red' }))
  end)

  it('Orange and orange', function()
    assert.equal(33, rcd.value({ 'orange', 'orange' }))
  end)

  it('Ignore additional colors', function()
    assert.equal(51, rcd.value({ 'green', 'brown', 'orange' }))
  end)

  it('Black and brown, one-digit', function()
    assert.equal(1, rcd.value({ 'black', 'brown' }))
  end)
end)
