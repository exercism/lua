local rcd = require('resistor-color-duo')

describe('resistor-color-duo', function()
  it('brown and black', function()
    assert.equal(10, rcd.value({ 'brown', 'black' }))
  end)

  it('blue and grey', function()
    assert.equal(68, rcd.value({ 'blue', 'grey' }))
  end)

  it('yellow and violet', function()
    assert.equal(47, rcd.value({ 'yellow', 'violet' }))
  end)

  it('white and red', function()
    assert.equal(92, rcd.value({ 'white', 'red' }))
  end)

  it('orange and orange', function()
    assert.equal(33, rcd.value({ 'orange', 'orange' }))
  end)

  it('ignore additional colors', function()
    assert.equal(51, rcd.value({ 'green', 'brown', 'orange' }))
  end)

  it('black and brown, one-digit', function()
    assert.equal(1, rcd.value({ 'black', 'brown' }))
  end)
end)
