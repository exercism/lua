local function map(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function stringify(x)
  return ("'%s'"):format(x)
end

return {
  module_name = 'School',

  generate_test = function(case)
    local lines = { 'local school = School:new()' }

    if case.property == 'grade' or case.property == 'roster' then
      for _, input in ipairs(case.input.students) do
        local student, grade = table.unpack(input)
        table.insert(lines, ('school:add(%s, %d)'):format(stringify(student), grade))
      end
      table.insert(lines,
                   ('assert.are.same({ %s }, school:%s(%s))'):format(table.concat(map(case.expected, stringify), ', '),
                                                                     case.property, case.input.desiredGrade or ''))
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
        table.insert(lines, ('assert.is_%s(school:add(%s, %d))'):format(expected, stringify(student), grade))
      end
    else
      error("Unknown property: " .. case.property)
    end

    return table.concat(lines, '\n')
  end
}
