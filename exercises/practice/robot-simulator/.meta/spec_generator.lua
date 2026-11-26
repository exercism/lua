return {
  module_name = 'Robot',

  generate_test = function(case)
    local lines = {
      ("local robot = Robot { x = %d, y = %d, heading = '%s' }"):format(case.input.position.x, case.input.position.y,
                                                                        case.input.direction)
    }

    if case.property == 'move' then
      table.insert(lines, ("robot:move('%s')"):format(case.input.instructions))
    end

    table.insert(lines, ('assert.equal(%d, robot.x)'):format(case.expected.position.x))
    table.insert(lines, ('assert.equal(%d, robot.y)'):format(case.expected.position.y))
    table.insert(lines, ("assert.equal('%s', robot.heading)"):format(case.expected.direction))

    return table.concat(lines, '\n')
  end
}
