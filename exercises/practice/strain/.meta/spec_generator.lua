local utils = require 'utils'

local PREDICATES = {
  ['fn(x) -> true'] = 'function(x) return true end',
  ['fn(x) -> false'] = 'function(x) return false end',
  ['fn(x) -> x % 2 == 1'] = 'function(x) return x % 2 == 1 end',
  ['fn(x) -> x % 2 == 0'] = 'function(x) return x % 2 == 0 end',
  ["fn(x) -> starts_with(x, 'z')"] = "function(x) return x:sub(1, 1) == 'z' end",
  ['fn(x) -> contains(x, 5)'] = [[function(x)
    for _, value in ipairs(x) do
      if value == 5 then
        return true
      end
    end
    return false
  end]]
}

local function render_value(value)
  if type(value) == 'table' then
    return '{ ' .. table.concat(utils.map(value, render_value), ', ') .. ' }'
  elseif type(value) == 'string' then
    return utils.stringify(value)
  end
  return tostring(value)
end

return {
  module_name = 'strain',

  generate_test = function(case)
    local template = [[
      local predicate = %s
      local list = %s
      local expected = %s
      assert.are.same(expected, strain.%s(list, predicate))]]
    return template:format(PREDICATES[case.input.predicate], render_value(case.input.list), render_value(case.expected),
                           case.property)
  end
}
