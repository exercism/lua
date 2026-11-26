local utils = require 'utils'

-- The rows are laid out by hand, one per line, so that the digits are legible
-- in the spec. This is excluded from formatting so that it stays that way.
local function render_rows(rows)
  local lines = {}
  for i, row in ipairs(rows) do
    lines[i] = '      ' .. utils.stringify(row .. (i < #rows and '\n' or ''))
  end
  return table.concat(lines, ' --\n ..')
end

return {
  module_name = 'ocr',

  generate_test = function(case)
    local input = table.concat({ "    local input = '' --\n ..", render_rows(case.input.rows) }, '\n')

    if type(case.expected) == 'table' then
      local template = [[
        %s
        assert.has_error(function()
          ocr.convert(input)
        end)]]
      return template:format(input)
    end

    local template = [[
      %s
      assert.equal(%s, ocr.convert(input))]]
    return template:format(input, utils.stringify(case.expected))
  end
}
