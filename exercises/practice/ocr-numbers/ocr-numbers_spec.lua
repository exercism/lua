local ocr = require('ocr-numbers')

describe('ocr-numbers', function()
  it('recognizes 0', function()
    local input = '' --
    .. ' _ \n' --
    .. '| |\n' --
    .. '|_|\n' --
    .. '   '
    assert.equal('0', ocr.convert(input))
  end)

  it('recognizes 1', function()
    local input = '' --
    .. '   \n' --
    .. '  |\n' --
    .. '  |\n' --
    .. '   '
    assert.equal('1', ocr.convert(input))
  end)

  it('unreadable but correctly sized inputs return ?', function()
    local input = '' --
    .. '   \n' --
    .. '  _\n' --
    .. '  |\n' --
    .. '   '
    assert.equal('?', ocr.convert(input))
  end)

  it('input with a number of lines that is not a multiple of four raises an error', function()
    local input = '' --
    .. ' _ \n' --
    .. '| |\n' --
    .. '   '
    assert.has_error(function()
      ocr.convert(input)
    end)
  end)

  it('input with a number of columns that is not a multiple of three raises an error', function()
    local input = '' --
    .. '    \n' --
    .. '   |\n' --
    .. '   |\n' --
    .. '    '
    assert.has_error(function()
      ocr.convert(input)
    end)
  end)

  it('recognizes 110101100', function()
    local input = '' --
    .. '       _     _        _  _ \n' --
    .. '  |  || |  || |  |  || || |\n' --
    .. '  |  ||_|  ||_|  |  ||_||_|\n' --
    .. '                           '
    assert.equal('110101100', ocr.convert(input))
  end)

  it('garbled numbers in a string are replaced with ?', function()
    local input = '' --
    .. '       _     _           _ \n' --
    .. '  |  || |  || |     || || |\n' --
    .. '  |  | _|  ||_|  |  ||_||_|\n' --
    .. '                           '
    assert.equal('11?10?1?0', ocr.convert(input))
  end)

  it('recognizes 2', function()
    local input = '' --
    .. ' _ \n' --
    .. ' _|\n' --
    .. '|_ \n' --
    .. '   '
    assert.equal('2', ocr.convert(input))
  end)

  it('recognizes 3', function()
    local input = '' --
    .. ' _ \n' --
    .. ' _|\n' --
    .. ' _|\n' --
    .. '   '
    assert.equal('3', ocr.convert(input))
  end)

  it('recognizes 4', function()
    local input = '' --
    .. '   \n' --
    .. '|_|\n' --
    .. '  |\n' --
    .. '   '
    assert.equal('4', ocr.convert(input))
  end)

  it('recognizes 5', function()
    local input = '' --
    .. ' _ \n' --
    .. '|_ \n' --
    .. ' _|\n' --
    .. '   '
    assert.equal('5', ocr.convert(input))
  end)

  it('recognizes 6', function()
    local input = '' --
    .. ' _ \n' --
    .. '|_ \n' --
    .. '|_|\n' --
    .. '   '
    assert.equal('6', ocr.convert(input))
  end)

  it('recognizes 7', function()
    local input = '' --
    .. ' _ \n' --
    .. '  |\n' --
    .. '  |\n' --
    .. '   '
    assert.equal('7', ocr.convert(input))
  end)

  it('recognizes 8', function()
    local input = '' --
    .. ' _ \n' --
    .. '|_|\n' --
    .. '|_|\n' --
    .. '   '
    assert.equal('8', ocr.convert(input))
  end)

  it('recognizes 9', function()
    local input = '' --
    .. ' _ \n' --
    .. '|_|\n' --
    .. ' _|\n' --
    .. '   '
    assert.equal('9', ocr.convert(input))
  end)

  it('recognizes string of decimal numbers', function()
    local input = '' --
    .. '    _  _     _  _  _  _  _  _ \n' --
    .. '  | _| _||_||_ |_   ||_||_|| |\n' --
    .. '  ||_  _|  | _||_|  ||_| _||_|\n' --
    .. '                              '
    assert.equal('1234567890', ocr.convert(input))
  end)

  it('numbers separated by empty lines are recognized. lines are joined by commas.', function()
    local input = '' --
    .. '    _  _ \n' --
    .. '  | _| _|\n' --
    .. '  ||_  _|\n' --
    .. '         \n' --
    .. '    _  _ \n' --
    .. '|_||_ |_ \n' --
    .. '  | _||_|\n' --
    .. '         \n' --
    .. ' _  _  _ \n' --
    .. '  ||_||_|\n' --
    .. '  ||_| _|\n' --
    .. '         '
    assert.equal('123,456,789', ocr.convert(input))
  end)
end)
