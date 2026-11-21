local utils = require 'utils'

local function render_matrix(rows)
  local rendered = utils.map(rows, function(row)
    return '{ ' .. table.concat(row, ', ') .. ' }'
  end)
  return '{ ' .. table.concat(rendered, ', ') .. ' }'
end

return {
  module_name = 'Triangle',

  generate_test = function(case)
    local template = [[
      local expected = %s
      assert.are.same(expected, Triangle(%d).rows)]]
    return template:format(render_matrix(case.expected), case.input.count)
  end
}
