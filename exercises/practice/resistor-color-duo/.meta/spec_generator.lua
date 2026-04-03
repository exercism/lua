local function map(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function stringify(s)
  return "'" .. s .. "'"
end

return {
  module_name = 'rcd',

  generate_test = function(case)
    local template = [[
        assert.equal(%d, rcd.value({ %s }))]]
    return template:format(case.expected, table.concat(map(case.input.colors, stringify), ', '))
  end
}
