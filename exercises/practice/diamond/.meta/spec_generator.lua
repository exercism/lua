local utils = require 'utils'

local function render_rows(rows)
  local parts = utils.map(rows, function(row)
    return utils.stringify(row .. '\n') .. ' --\n'
  end)
  return table.concat(parts, ' .. ')
end

return {
  module_name = 'diamond',

  generate_test = function(case)
    local template = [[
      local expected = '' --
      .. %s
      assert.are.equal(expected, diamond(%s))]]
    return template:format(render_rows(case.expected), utils.stringify(case.input.letter))
  end
}
