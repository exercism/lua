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
  module_name = 'forth',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has.error(function()
          forth.evaluate({ %s })
        end)]]

      return template:format(table.concat(map(case.input.instructions, stringify), ' '), case.expected.error)
    elseif case.input.instructions then
      local template = [[
        assert.are.same({ %s }, forth.evaluate({ %s }))]]

      return template:format(table.concat(map(case.expected, tostring), ', '),
                             table.concat(map(case.input.instructions, stringify), ', '))
    else
      local template = [[
        assert.are.same({ %s }, forth.evaluate({ %s }))
        assert.are.same({ %s }, forth.evaluate({ %s }))]]

      return template:format(table.concat(map(case.expected[1], tostring), ', '),
                             table.concat(map(case.input.instructionsFirst, stringify), ', '),
                             table.concat(map(case.expected[2], tostring), ', '),
                             table.concat(map(case.input.instructionsSecond, stringify), ', '))
    end
  end
}
