local Robot = require('robot-name')

describe('robot-name', function()
  it('has a name', function()
    local robot = Robot:new()
    -- lua does not support fixed patterns like %w{2}%d{3}
    assert.are.equal(string.match(robot.name, '^%a%a%d%d%d$'), robot.name)
  end)

  it('name is the same each time', function()
    local robot = Robot:new()
    assert.are.equal(robot.name, robot.name)
  end)

  it('different robots have different names', function()
    local robotOne = Robot:new()
    local robotTwo = Robot:new()
    assert.are_not.equal(robotOne.name, robotTwo.name)
  end)

  it('is able to reset the name', function()
    local robot = Robot:new()
    local originalName = robot.name
    robot:reset()
    assert.are_not.equal(originalName, robot.name)
  end)
end)
