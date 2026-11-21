local utils = require 'utils'

local function render_matrix(matrix)
  local rows = utils.map(matrix, function(row)
    return '{ ' .. table.concat(row, ', ') .. ' }'
  end)
  return '{ ' .. table.concat(rows, ', --\n') .. ' }'
end

return {
  module_name = 'spiral_matrix',

  generate_test = function(case)
    local template = [[
      local expected = %s
      assert.are.same(expected, spiral_matrix(%d))]]
    return template:format(render_matrix(case.expected), case.input.size)
  end
}
