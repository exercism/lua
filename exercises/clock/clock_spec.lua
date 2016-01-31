local clock = require('clock')

describe('clock', function()

  it('prints the hour', function()
    assert.are.equals('08:00', tostring(clock.at(8)))
    assert.are.equals('09:00', tostring(clock.at(9)))
  end)

  it('prints past the hour', function()
    assert.are.equals('11:09', tostring(clock.at(11, 9)))
    assert.are.equals('11:19', tostring(clock.at(11, 19)))
  end)

  it('can add minutes', function()
    local clock = clock.at(10):plus(3)
    assert.are.equals('10:03', tostring(clock))
  end)

  it('can add over an hour', function()
    local clock = clock.at(10):plus(61)
    assert.are.equals('11:01', tostring(clock))
  end)

  it('wraps around midnight', function()
    local clock = clock.at(23, 59):plus(2)
    assert.are.equals('00:01', tostring(clock))
  end)

  it('can subtract minutes', function()
    local clock = clock.at(10, 3):minus(3)
    assert.are.equals('10:00', tostring(clock))
  end)

  it('can subtract over an hour', function()
    local clock = clock.at(10, 3):minus(30)
    assert.are.equals('09:33', tostring(clock))

    local clock = clock.at(10, 3):minus(70)
    assert.are.equals('08:53', tostring(clock))
  end)

  it('can know if it is equal to another clock', function()
    local clock1 = clock.at(10, 3)
    local clock2 = clock.at(10, 3)
    assert(clock1:equals(clock2))
  end)

  it('can know if it is not equal to another clock', function()
    local clock1 = clock.at(10, 3)
    local clock2 = clock.at(10, 4)
    assert.is_false(clock1:equals(clock2))
  end)

  it('wraps around midnight backwards', function()
    local clock = clock.at(0, 3):minus(4)
    assert.are.equals('23:59', tostring(clock))
  end)

end)
