local utils = require 'utils'

local function render_strings(strings)
  if #strings == 0 then
    return '{}'
  end
  return '{ ' .. table.concat(utils.map(strings, utils.stringify), ', ') .. ' }'
end

return {
  module_name = 'grep',

  generate_test = function(case)
    local template = [[
      local expected = %s
      local actual = grep({ files = %s, flags = %s, pattern = %s })
      assert.are.same(expected, actual)]]
    return template:format(render_strings(case.expected), render_strings(case.input.files),
                           render_strings(case.input.flags), utils.stringify(case.input.pattern))
  end
}
