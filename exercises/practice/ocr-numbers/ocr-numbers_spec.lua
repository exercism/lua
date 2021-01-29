local ocr = require('ocr-numbers')

describe('ocr-numbers', function()
  it('should recognize zero', function()
    local actual = ocr.convert(
      ' _ \n' ..
      '| |\n' ..
      '|_|\n' ..
      '   '
    )
    assert.equal('0', actual)
  end)

  it('should recognize one', function()
    local actual = ocr.convert(
      '   \n' ..
      '  |\n' ..
      '  |\n' ..
      '   '
    )
    assert.equal('1', actual)
  end)

  it('should recognize two', function()
    local actual = ocr.convert(
      ' _ \n' ..
      ' _|\n' ..
      '|_ \n' ..
      '   '
    )
    assert.equal('2', actual)
  end)

  it('should recognize three', function()
    local actual = ocr.convert(
      ' _ \n' ..
      ' _|\n' ..
      ' _|\n' ..
      '   '
    )
    assert.equal('3', actual)
  end)

  it('should recognize four', function()
    local actual = ocr.convert(
      '   \n' ..
      '|_|\n' ..
      '  |\n' ..
      '   '
    )
    assert.equal('4', actual)
  end)

  it('should recognize five', function()
    local actual = ocr.convert(
      ' _ \n' ..
      '|_ \n' ..
      ' _|\n' ..
      '   '
    )
    assert.equal('5', actual)
  end)

  it('should recognize six', function()
    local actual = ocr.convert(
      ' _ \n' ..
      '|_ \n' ..
      '|_|\n' ..
      '   '
    )
    assert.equal('6', actual)
  end)

  it('should recognize seven', function()
    local actual = ocr.convert(
      ' _ \n' ..
      '  |\n' ..
      '  |\n' ..
      '   '
    )
    assert.equal('7', actual)
  end)

  it('should recognize eight', function()
    local actual = ocr.convert(
      ' _ \n' ..
      '|_|\n' ..
      '|_|\n' ..
      '   '
    )
    assert.equal('8', actual)
  end)

  it('should recognize nine', function()
    local actual = ocr.convert(
      ' _ \n' ..
      '|_|\n' ..
      ' _|\n' ..
      '   '
    )
    assert.equal('9', actual)
  end)

  it('should identify garble', function()
    local actual = ocr.convert(
      '   \n' ..
      '| |\n' ..
      '| |\n' ..
      '   '
    )
    assert.equal('?', actual)
  end)

  it('should recognize two numbers on the same line', function()
    local actual = ocr.convert(
      '    _ \n' ..
      '  || |\n' ..
      '  ||_|\n' ..
      '      '
    )
    assert.equal('10', actual)
  end)

  it('should recognize multiple numbers on the same line', function()
    local actual = ocr.convert(
      '    _  _     _  _  _  _  _  _ \n' ..
      '  | _| _||_||_ |_   ||_||_|| |\n' ..
      '  ||_  _|  | _||_|  ||_| _||_|\n' ..
      '                              '
    )
    assert.equal('1234567890', actual)
  end)

  it('should identify garble mixed into a line of numbers', function()
    local actual = ocr.convert(
      '       _     _           _ \n' ..
      '  |  || |  || |     || || |\n' ..
      '  |  | _|  ||_|  |  ||_||_|\n' ..
      '                           '
    )
    assert.equal('11?10?1?0', actual)
  end)

  it('should convert multiple lines of numbers as comma separated values', function()
    local actual = ocr.convert(
      '    _  _ \n' ..
      '  | _| _|\n' ..
      '  ||_  _|\n' ..
      '         \n' ..
      '    _  _ \n' ..
      '|_||_ |_ \n' ..
      '  | _||_|\n' ..
      '         \n' ..
      ' _  _  _ \n' ..
      '  ||_||_|\n' ..
      '  ||_| _|\n' ..
      '         '
    )
    assert.equal('123,456,789', actual)
  end)

  it('should generate error if input is incorrectly sized', function()
      assert.has_error(function() ocr.convert(
        ' _ \n' ..
        '||\n' ..
        '|_|\n' ..
        '   ') end)

      assert.has_error(function() ocr.convert(
        '     _ \n' ..
        '  | _| _|\n' ..
        '  |_  _|\n' ..
        '         \n') end)

      assert.has_error(function() ocr.convert(
        '    _  _ \n' ..
        '  | _| _|\n' ..
        '  ||_ \n' ..
        '         \n') end)
  end)
end)
