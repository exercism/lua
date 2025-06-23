local flower_field = require('flower-field')

describe('flower-field', function()
  it('no rows', function()
    local garden = {}
    local expected = {}
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('no columns', function()
    local garden = {
      '' --
    }
    local expected = {
      '' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('no flowers', function()
    local garden = {
      '   ', -- ,
      '   ', -- ,
      '   ' --
    }
    local expected = {
      '   ', -- ,
      '   ', -- ,
      '   ' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('garden full of flowers', function()
    local garden = {
      '***', -- ,
      '***', -- ,
      '***' --
    }
    local expected = {
      '***', -- ,
      '***', -- ,
      '***' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('flower surrounded by spaces', function()
    local garden = {
      '   ', -- ,
      ' * ', -- ,
      '   ' --
    }
    local expected = {
      '111', -- ,
      '1*1', -- ,
      '111' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('space surrounded by flowers', function()
    local garden = {
      '***', -- ,
      '* *', -- ,
      '***' --
    }
    local expected = {
      '***', -- ,
      '*8*', -- ,
      '***' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('horizontal line', function()
    local garden = {
      ' * * ' --
    }
    local expected = {
      '1*2*1' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('horizontal line, flowers at edges', function()
    local garden = {
      '*   *' --
    }
    local expected = {
      '*1 1*' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('vertical line', function()
    local garden = {
      ' ', -- ,
      '*', -- ,
      ' ', -- ,
      '*', -- ,
      ' ' --
    }
    local expected = {
      '1', -- ,
      '*', -- ,
      '2', -- ,
      '*', -- ,
      '1' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('vertical line, flowers at edges', function()
    local garden = {
      '*', -- ,
      ' ', -- ,
      ' ', -- ,
      ' ', -- ,
      '*' --
    }
    local expected = {
      '*', -- ,
      '1', -- ,
      ' ', -- ,
      '1', -- ,
      '*' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('cross', function()
    local garden = {
      '  *  ', -- ,
      '  *  ', -- ,
      '*****', -- ,
      '  *  ', -- ,
      '  *  ' --
    }
    local expected = {
      ' 2*2 ', -- ,
      '25*52', -- ,
      '*****', -- ,
      '25*52', -- ,
      ' 2*2 ' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)

  it('large garden', function()
    local garden = {
      ' *  * ', -- ,
      '  *   ', -- ,
      '    * ', -- ,
      '   * *', -- ,
      ' *  * ', -- ,
      '      ' --
    }
    local expected = {
      '1*22*1', -- ,
      '12*322', -- ,
      ' 123*2', -- ,
      '112*4*', -- ,
      '1*22*2', -- ,
      '111111' --
    }
    assert.same(expected, flower_field.annotate(garden))
  end)
end)
