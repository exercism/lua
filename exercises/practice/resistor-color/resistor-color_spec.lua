local rc = require('resistor-color')

describe('resistor-color', function()
  describe('color codes', function()
    it('black', function()
      assert.equal(0, rc.color_code('black'))
    end)

    it('white', function()
      assert.equal(9, rc.color_code('white'))
    end)

    it('orange', function()
      assert.equal(3, rc.color_code('orange'))
    end)
  end)

  it('colors', function()
    assert.same({
      'black', --
      'brown', --
      'red', --
      'orange', --
      'yellow', --
      'green', --
      'blue', --
      'violet', --
      'grey', --
      'white'
    }, rc.colors())
  end)
end)
