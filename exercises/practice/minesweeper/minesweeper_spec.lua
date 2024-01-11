local minesweeper = require('minesweeper')

describe('minesweeper', function()
  it('should be able to transform a 1x1 board with a single mine', function()
    local input = { '*-*', '|*|', '*-*' }
    local expected = { '*-*', '|*|', '*-*' }
    assert.same(expected, minesweeper.transform(input))
  end)

  it('should be able to transform a board with no mines', function()
    local input = { '*---*', '|   |', '|   |', '|   |', '*---*' }
    local expected = { '*---*', '|   |', '|   |', '|   |', '*---*' }
    assert.same(expected, minesweeper.transform(input))
  end)

  it('should be able to transform a small board with a single mine', function()
    local input = { '*---*', '|   |', '| * |', '|   |', '*---*' }
    local expected = { '*---*', '|111|', '|1*1|', '|111|', '*---*' }
    assert.same(expected, minesweeper.transform(input))
  end)

  it('should be able to transform a small board with multiple mines', function()
    local input = { '*---*', '|   |', '|** |', '|   |', '*---*' }
    local expected = { '*---*', '|221|', '|**1|', '|221|', '*---*' }
    assert.same(expected, minesweeper.transform(input))
  end)

  it('should be able to transform a larger board with multiple mines', function()
    local input = { '+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|', '| *  * |', '|      |', '+------+' }
    local expected = { '+------+', '|1*22*1|', '|12*322|', '| 123*2|', '|112*4*|', '|1*22*2|', '|111111|', '+------+' }
    assert.same(expected, minesweeper.transform(input))
  end)

  it('should be able to transform a board that is not square', function()
    local input = { '*---*', '|   |', '|** |', '*---*' }
    local expected = { '*---*', '|221|', '|**1|', '*---*' }
    assert.same(expected, minesweeper.transform(input))
  end)

  it('should assert that the board is a rectangle', function()
    local input = { '*---*', '|  |', '| * |', '*---*' }
    assert.has_error(function()
      minesweeper.transform(input)
    end)
  end)

  it('should assert that the input contains only space and asterisk characters on the board', function()
    local input = { '*---*', '|   |', '| X |', '*---*' }
    assert.has_error(function()
      minesweeper.transform(input)
    end)
  end)
end)
