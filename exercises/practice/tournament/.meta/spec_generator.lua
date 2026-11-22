local utils = require 'utils'

local function render_lines(lines)
  return '{ ' .. table.concat(utils.map(lines, utils.stringify), ', ') .. ' }'
end

return {
  module_name = 'tournament',

  generate_test = function(case)
    local template = [[
      local rows = %s
      local expected = %s
      assert.are.same(expected, tournament(rows))]]
    return template:format(render_lines(case.input.rows), render_lines(case.expected))
  end
}
