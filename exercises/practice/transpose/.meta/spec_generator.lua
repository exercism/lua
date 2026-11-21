local utils = require 'utils'

local function render_lines(lines)
  return utils.stringify(table.concat(lines, '\n')):gsub('\\n', "\\n' -- \n .. '")
end

return {
  module_name = 'transpose',

  generate_test = function(case)
    local template = [[
      local input = '' --
      .. %s

      local expected = '' --
      .. %s

      assert.are.equal(expected, transpose(input))]]
    return template:format(render_lines(case.input.lines), render_lines(case.expected))
  end
}
