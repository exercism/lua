local Robot = require('robot-simulator')

describe('robot-simulator', function()
  it('should make the current x, y, and heading available', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    assert.equal(5, robot.x)
    assert.equal(10, robot.y)
    assert.equal('north', robot.heading)
  end)

  it('should move forward when an A command is given', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    robot:move('A')
    assert.equal(5, robot.x)
    assert.equal(11, robot.y)
    assert.equal('north', robot.heading)
  end)

  it('should change heading clockwise when an R command is given', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    robot:move('R')
    assert.equal(5, robot.x)
    assert.equal(10, robot.y)
    assert.equal('east', robot.heading)
  end)

  it('should change heading counter-clockwise when an L command is given', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    robot:move('L')
    assert.equal(5, robot.x)
    assert.equal(10, robot.y)
    assert.equal('west', robot.heading)
  end)

  it('should be able to chain commands', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    robot:move('LAR')
    assert.equal(4, robot.x)
    assert.equal(10, robot.y)
    assert.equal('north', robot.heading)
  end)

  it('should be able to turn all the way around by turning clockwise', function()
    local robot = Robot{ x = 7, y = -10, heading = 'north' }
    robot:move('RRRR')
    assert.equal(7, robot.x)
    assert.equal(-10, robot.y)
    assert.equal('north', robot.heading)
  end)

  it('should be able to turn all the way around by turning counter-clockwise', function()
    local robot = Robot{ x = 5, y = 10, heading = 'south' }
    robot:move('LLLL')
    assert.equal(5, robot.x)
    assert.equal(10, robot.y)
    assert.equal('south', robot.heading)
  end)

  it('should be able to advance in all directions', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    robot:move('ARAARAARAR')
    assert.equal(6, robot.x)
    assert.equal(9, robot.y)
    assert.equal('north', robot.heading)
  end)

  it('should raise an error when an invalid command is used', function()
    local robot = Robot{ x = 5, y = 10, heading = 'north' }
    assert.has_errors(function() robot:move('ARALZR') end)
  end)
end)
