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
  module_name = 'rct',

  generate_test = function(case)
    local template = [[
        local value, unit = rct.%s(%s)
        assert.are.equal(%s, value)
        assert.are.equal('%s', unit)]]
    return template:format(table.unpack({
      case.property,
      table.concat(map(case.input.colors, stringify), ', '),
      case.expected.value,
      case.expected.unit
    }))
  end
}
