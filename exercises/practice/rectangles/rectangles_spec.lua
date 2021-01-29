local rectangles = require('rectangles')

describe('rectangles', function()
  it('should find 0 rectangles in an empty grid', function()
    assert.equal(0, rectangles.count({}))
  end)

  it('should find 0 rectangles in a non-empty grid', function()
    assert.equal(0, rectangles.count({
      '   ',
      '   '
    }))
  end)

  it('should find a single rectangle', function()
    assert.equal(1, rectangles.count({
      '+-+',
      '| |',
      '+-+'
    }))
  end)

  it('should find connected rectangles', function()
    assert.equal(2, rectangles.count({
      '  +-+',
      '  | |',
      '+-+-+',
      '| |  ',
      '+-+  '
    }))
  end)

  it('should find nested rectangles', function()
    assert.equal(5, rectangles.count({
      '  +-+',
      '  | |',
      '+-+-+',
      '| | |',
      '+-+-+'
    }))
  end)

  it('should not count incomplete rectangles', function()
    assert.equal(1, rectangles.count({
      '  +-+',
      '    |',
      '+-+-+',
      '| | -',
      '+-+-+'
    }))
  end)

  it('should not count rectangles without 4 corners', function()
    assert.equal(2, rectangles.count({
      '+------+----+',
      '|      |    |',
      '+------+    |',
      '|   |       |',
      '+---+-------+'
    }))
  end)

  it('should find rectangles in large input', function()
    assert.equal(60, rectangles.count({
      '               ',
      ' +---+--+----+ ',
      ' |   +--+----+ ',
      ' +---+--+    | ',
      ' |   +--+----+ ',
      ' +---+--+--+-+ ',
      ' +---+--+--+-+ ',
      ' +------+  | | ',
      '           +-+ ',
      '               '
    }))
  end)
end)
