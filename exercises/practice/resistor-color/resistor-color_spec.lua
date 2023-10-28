local rc = require 'resistor-color'

describe('resistor-color', function()
  it('Black', function()
    assert.equal(0, rc.color_code('black'))
  end)

  it('Brown', function()
    assert.equal(1, rc.color_code('brown'))
  end)

  it('Red', function()
    assert.equal(2, rc.color_code('red'))
  end)

  it('Orange', function()
    assert.equal(3, rc.color_code('orange'))
  end)

  it('Yellow', function()
    assert.equal(4, rc.color_code('yellow'))
  end)

  it('Green', function()
    assert.equal(5, rc.color_code('green'))
  end)

  it('Blue', function()
    assert.equal(6, rc.color_code('blue'))
  end)

  it('Violet', function()
    assert.equal(7, rc.color_code('violet'))
  end)

  it('Grey', function()
    assert.equal(8, rc.color_code('grey'))
  end)

  it('White', function()
    assert.equal(9, rc.color_code('white'))
  end)
end)
