local function map(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

return {
  module_name = 'Garden',

  generate_test = function(case)
    local diagram = case.input.diagram:gsub('\n', '\\n')
    local expected = table.concat(map(case.expected, function(x)
      return ("'%s'"):format(x)
    end), ', ')

    local template = [[
      local garden = Garden('%s')
      assert.same({ %s }, garden.%s('%s'))]]
    return template:format(diagram, expected, case.property, case.input.student)
  end
}
