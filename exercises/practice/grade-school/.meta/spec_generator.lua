local utils = require 'utils'

return {
  module_name = 'School',

  generate_test = function(case)
    local lines = { 'local school = School:new()' }

    if case.property == 'grade' or case.property == 'roster' then
      for _, input in ipairs(case.input.students) do
        local student, grade = table.unpack(input)
        table.insert(lines, ('school:add(%s, %d)'):format(utils.stringify(student), grade))
      end
      table.insert(lines,
                   ('assert.are.same({ %s }, school:%s(%s))'):format(
                     table.concat(utils.map(case.expected, utils.stringify), ', '), case.property,
                     case.input.desiredGrade or ''))
    elseif case.property == 'add' then
      for i, input in ipairs(case.input.students) do
        local student, grade = table.unpack(input)
        local expected
        do
          if type(case.expected) == 'table' then
            expected = case.expected[i]
          else
            expected = case.expected
          end
        end
        table.insert(lines, ('assert.is_%s(school:add(%s, %d))'):format(expected, utils.stringify(student), grade))
      end
    else
      error("Unknown property: " .. case.property)
    end

    return table.concat(lines, '\n')
  end
}
