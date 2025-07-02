local rectangles = require('rectangles')

describe('rectangles', function()
  it('no rows', function()
    assert.equal(0, rectangles.count({}))
  end)

  it('no columns', function()
    assert.equal(0, rectangles.count({
      '' --
    }))
  end)

  it('no rectangles', function()
    assert.equal(0, rectangles.count({
      ' ' --
    }))
  end)

  it('one rectangle', function()
    assert.equal(1, rectangles.count({
      '+-+', -- ,
      '| |', -- ,
      '+-+' --
    }))
  end)

  it('two rectangles without shared parts', function()
    assert.equal(2, rectangles.count({
      '  +-+', -- ,
      '  | |', -- ,
      '+-+-+', -- ,
      '| |  ', -- ,
      '+-+  ' --
    }))
  end)

  it('five rectangles with shared parts', function()
    assert.equal(5, rectangles.count({
      '  +-+', -- ,
      '  | |', -- ,
      '+-+-+', -- ,
      '| | |', -- ,
      '+-+-+' --
    }))
  end)

  it('rectangle of height 1 is counted', function()
    assert.equal(1, rectangles.count({
      '+--+', -- ,
      '+--+' --
    }))
  end)

  it('rectangle of width 1 is counted', function()
    assert.equal(1, rectangles.count({
      '++', -- ,
      '||', -- ,
      '++' --
    }))
  end)

  it('1x1 square is counted', function()
    assert.equal(1, rectangles.count({
      '++', -- ,
      '++' --
    }))
  end)

  it('only complete rectangles are counted', function()
    assert.equal(1, rectangles.count({
      '  +-+', -- ,
      '    |', -- ,
      '+-+-+', -- ,
      '| | -', -- ,
      '+-+-+' --
    }))
  end)

  it('rectangles can be of different sizes', function()
    assert.equal(3, rectangles.count({
      '+------+----+', -- ,
      '|      |    |', -- ,
      '+---+--+    |', -- ,
      '|   |       |', -- ,
      '+---+-------+' --
    }))
  end)

  it('corner is required for a rectangle to be complete', function()
    assert.equal(2, rectangles.count({
      '+------+----+', -- ,
      '|      |    |', -- ,
      '+------+    |', -- ,
      '|   |       |', -- ,
      '+---+-------+' --
    }))
  end)

  it('large input with many rectangles', function()
    assert.equal(60, rectangles.count({
      '+---+--+----+', -- ,
      '|   +--+----+', -- ,
      '+---+--+    |', -- ,
      '|   +--+----+', -- ,
      '+---+--+--+-+', -- ,
      '+---+--+--+-+', -- ,
      '+------+  | |', -- ,
      '          +-+' --
    }))
  end)

  it('rectangles must have four sides', function()
    assert.equal(5, rectangles.count({
      '+-+ +-+', -- ,
      '| | | |', -- ,
      '+-+-+-+', -- ,
      '  | |  ', -- ,
      '+-+-+-+', -- ,
      '| | | |', -- ,
      '+-+ +-+' --
    }))
  end)
end)
