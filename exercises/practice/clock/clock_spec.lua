local clock = require('clock')

describe('clock', function()
  describe('create a new clock with an initial time', function()
    it('on the hour', function()
      assert.are.equal('08:00', tostring(clock.at(8, 0)))
    end)

    it('past the hour', function()
      assert.are.equal('11:09', tostring(clock.at(11, 9)))
    end)

    it('midnight is zero hours', function()
      assert.are.equal('00:00', tostring(clock.at(24, 0)))
    end)

    it('hour rolls over', function()
      assert.are.equal('01:00', tostring(clock.at(25, 0)))
    end)

    it('hour rolls over continuously', function()
      assert.are.equal('04:00', tostring(clock.at(100, 0)))
    end)

    it('sixty minutes is next hour', function()
      assert.are.equal('02:00', tostring(clock.at(1, 60)))
    end)

    it('minutes roll over', function()
      assert.are.equal('02:40', tostring(clock.at(0, 160)))
    end)

    it('minutes roll over continuously', function()
      assert.are.equal('04:43', tostring(clock.at(0, 1723)))
    end)

    it('hour and minutes roll over', function()
      assert.are.equal('03:40', tostring(clock.at(25, 160)))
    end)

    it('hour and minutes roll over continuously', function()
      assert.are.equal('11:01', tostring(clock.at(201, 3001)))
    end)

    it('hour and minutes roll over to exactly midnight', function()
      assert.are.equal('00:00', tostring(clock.at(72, 8640)))
    end)

    it('negative hour', function()
      assert.are.equal('23:15', tostring(clock.at(-1, 15)))
    end)

    it('negative hour rolls over', function()
      assert.are.equal('23:00', tostring(clock.at(-25, 0)))
    end)

    it('negative hour rolls over continuously', function()
      assert.are.equal('05:00', tostring(clock.at(-91, 0)))
    end)

    it('negative minutes', function()
      assert.are.equal('00:20', tostring(clock.at(1, -40)))
    end)

    it('negative minutes roll over', function()
      assert.are.equal('22:20', tostring(clock.at(1, -160)))
    end)

    it('negative minutes roll over continuously', function()
      assert.are.equal('16:40', tostring(clock.at(1, -4820)))
    end)

    it('negative sixty minutes is previous hour', function()
      assert.are.equal('01:00', tostring(clock.at(2, -60)))
    end)

    it('negative hour and minutes both roll over', function()
      assert.are.equal('20:20', tostring(clock.at(-25, -160)))
    end)

    it('negative hour and minutes both roll over continuously', function()
      assert.are.equal('22:10', tostring(clock.at(-121, -5810)))
    end)
  end)

  describe('add minutes', function()
    it('add minutes', function()
      assert.are.equal('10:03', tostring(clock.at(10, 0):plus(3)))
    end)

    it('add no minutes', function()
      assert.are.equal('06:41', tostring(clock.at(6, 41):plus(0)))
    end)

    it('add to next hour', function()
      assert.are.equal('01:25', tostring(clock.at(0, 45):plus(40)))
    end)

    it('add more than one hour', function()
      assert.are.equal('11:01', tostring(clock.at(10, 0):plus(61)))
    end)

    it('add more than two hours with carry', function()
      assert.are.equal('03:25', tostring(clock.at(0, 45):plus(160)))
    end)

    it('add across midnight', function()
      assert.are.equal('00:01', tostring(clock.at(23, 59):plus(2)))
    end)

    it('add more than one day (1500 min = 25 hrs)', function()
      assert.are.equal('06:32', tostring(clock.at(5, 32):plus(1500)))
    end)

    it('add more than two days', function()
      assert.are.equal('11:21', tostring(clock.at(1, 1):plus(3500)))
    end)
  end)

  describe('subtract minutes', function()
    it('subtract minutes', function()
      assert.are.equal('10:00', tostring(clock.at(10, 3):minus(3)))
    end)

    it('subtract to previous hour', function()
      assert.are.equal('09:33', tostring(clock.at(10, 3):minus(30)))
    end)

    it('subtract more than an hour', function()
      assert.are.equal('08:53', tostring(clock.at(10, 3):minus(70)))
    end)

    it('subtract across midnight', function()
      assert.are.equal('23:59', tostring(clock.at(0, 3):minus(4)))
    end)

    it('subtract more than two hours', function()
      assert.are.equal('21:20', tostring(clock.at(0, 0):minus(160)))
    end)

    it('subtract more than two hours with borrow', function()
      assert.are.equal('03:35', tostring(clock.at(6, 15):minus(160)))
    end)

    it('subtract more than one day (1500 min = 25 hrs)', function()
      assert.are.equal('04:32', tostring(clock.at(5, 32):minus(1500)))
    end)

    it('subtract more than two days', function()
      assert.are.equal('00:20', tostring(clock.at(2, 20):minus(3000)))
    end)
  end)

  describe('compare two clocks for equality', function()
    it('clocks with same time', function()
      local clock1 = clock.at(15, 37)
      local clock2 = clock.at(15, 37)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks a minute apart', function()
      local clock1 = clock.at(15, 36)
      local clock2 = clock.at(15, 37)
      assert.is_false(clock1:equals(clock2))
    end)

    it('clocks an hour apart', function()
      local clock1 = clock.at(14, 37)
      local clock2 = clock.at(15, 37)
      assert.is_false(clock1:equals(clock2))
    end)

    it('clocks with hour overflow', function()
      local clock1 = clock.at(10, 37)
      local clock2 = clock.at(34, 37)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with hour overflow by several days', function()
      local clock1 = clock.at(3, 11)
      local clock2 = clock.at(99, 11)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative hour', function()
      local clock1 = clock.at(22, 40)
      local clock2 = clock.at(-2, 40)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative hour that wraps', function()
      local clock1 = clock.at(17, 3)
      local clock2 = clock.at(-31, 3)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative hour that wraps multiple times', function()
      local clock1 = clock.at(13, 49)
      local clock2 = clock.at(-83, 49)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with minute overflow', function()
      local clock1 = clock.at(0, 1)
      local clock2 = clock.at(0, 1441)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with minute overflow by several days', function()
      local clock1 = clock.at(2, 2)
      local clock2 = clock.at(2, 4322)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative minute', function()
      local clock1 = clock.at(2, 40)
      local clock2 = clock.at(3, -20)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative minute that wraps', function()
      local clock1 = clock.at(4, 10)
      local clock2 = clock.at(5, -1490)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative minute that wraps multiple times', function()
      local clock1 = clock.at(6, 15)
      local clock2 = clock.at(6, -4305)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative hours and minutes', function()
      local clock1 = clock.at(7, 32)
      local clock2 = clock.at(-12, -268)
      assert.is_true(clock1:equals(clock2))
    end)

    it('clocks with negative hours and minutes that wrap', function()
      local clock1 = clock.at(18, 7)
      local clock2 = clock.at(-54, -11513)
      assert.is_true(clock1:equals(clock2))
    end)

    it('full clock and zeroed clock', function()
      local clock1 = clock.at(24, 0)
      local clock2 = clock.at(0, 0)
      assert.is_true(clock1:equals(clock2))
    end)
  end)
end)
