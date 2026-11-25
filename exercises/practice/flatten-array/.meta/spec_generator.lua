local utils = require 'utils'

local function render(value)
  if type(value) == 'table' then
    return '{ ' .. table.concat(utils.map(value, render), ', ') .. ' }'
  end
  return tostring(value)
end

return {
  module_name = 'flatten',

  generate_test = function(case)
    local template = [[
      local input = %s
      local expected = %s
      assert.are.same(expected, flatten(input))]]
    return template:format(render(case.input.array), render(case.expected))
  end
}
