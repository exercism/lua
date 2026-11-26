local Robot = require('robot-simulator')

describe('robot-simulator', function()
  describe('create robot', function()
    it('at origin facing north', function()
      local robot = Robot { x = 0, y = 0, heading = 'north' }
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('north', robot.heading)
    end)

    it('at negative position facing south', function()
      local robot = Robot { x = -1, y = -1, heading = 'south' }
      assert.equal(-1, robot.x)
      assert.equal(-1, robot.y)
      assert.equal('south', robot.heading)
    end)
  end)

  describe('rotating clockwise', function()
    it('changes north to east', function()
      local robot = Robot { x = 0, y = 0, heading = 'north' }
      robot:move('R')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('east', robot.heading)
    end)

    it('changes east to south', function()
      local robot = Robot { x = 0, y = 0, heading = 'east' }
      robot:move('R')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('south', robot.heading)
    end)

    it('changes south to west', function()
      local robot = Robot { x = 0, y = 0, heading = 'south' }
      robot:move('R')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('west', robot.heading)
    end)

    it('changes west to north', function()
      local robot = Robot { x = 0, y = 0, heading = 'west' }
      robot:move('R')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('north', robot.heading)
    end)
  end)

  describe('rotating counter-clockwise', function()
    it('changes north to west', function()
      local robot = Robot { x = 0, y = 0, heading = 'north' }
      robot:move('L')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('west', robot.heading)
    end)

    it('changes west to south', function()
      local robot = Robot { x = 0, y = 0, heading = 'west' }
      robot:move('L')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('south', robot.heading)
    end)

    it('changes south to east', function()
      local robot = Robot { x = 0, y = 0, heading = 'south' }
      robot:move('L')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('east', robot.heading)
    end)

    it('changes east to north', function()
      local robot = Robot { x = 0, y = 0, heading = 'east' }
      robot:move('L')
      assert.equal(0, robot.x)
      assert.equal(0, robot.y)
      assert.equal('north', robot.heading)
    end)
  end)

  describe('moving forward one', function()
    it('facing north increments y', function()
      local robot = Robot { x = 0, y = 0, heading = 'north' }
      robot:move('A')
      assert.equal(0, robot.x)
      assert.equal(1, robot.y)
      assert.equal('north', robot.heading)
    end)

    it('facing south decrements y', function()
      local robot = Robot { x = 0, y = 0, heading = 'south' }
      robot:move('A')
      assert.equal(0, robot.x)
      assert.equal(-1, robot.y)
      assert.equal('south', robot.heading)
    end)

    it('facing east increments x', function()
      local robot = Robot { x = 0, y = 0, heading = 'east' }
      robot:move('A')
      assert.equal(1, robot.x)
      assert.equal(0, robot.y)
      assert.equal('east', robot.heading)
    end)

    it('facing west decrements x', function()
      local robot = Robot { x = 0, y = 0, heading = 'west' }
      robot:move('A')
      assert.equal(-1, robot.x)
      assert.equal(0, robot.y)
      assert.equal('west', robot.heading)
    end)
  end)

  describe('follow series of instructions', function()
    it('moving east and north from readme', function()
      local robot = Robot { x = 7, y = 3, heading = 'north' }
      robot:move('RAALAL')
      assert.equal(9, robot.x)
      assert.equal(4, robot.y)
      assert.equal('west', robot.heading)
    end)

    it('moving west and north', function()
      local robot = Robot { x = 0, y = 0, heading = 'north' }
      robot:move('LAAARALA')
      assert.equal(-4, robot.x)
      assert.equal(1, robot.y)
      assert.equal('west', robot.heading)
    end)

    it('moving west and south', function()
      local robot = Robot { x = 2, y = -7, heading = 'east' }
      robot:move('RRAAAAALA')
      assert.equal(-3, robot.x)
      assert.equal(-8, robot.y)
      assert.equal('south', robot.heading)
    end)

    it('moving east and north', function()
      local robot = Robot { x = 8, y = 4, heading = 'south' }
      robot:move('LAAARRRALLLL')
      assert.equal(11, robot.x)
      assert.equal(5, robot.y)
      assert.equal('north', robot.heading)
    end)
  end)
end)
