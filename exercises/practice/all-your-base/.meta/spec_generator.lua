local utils = require 'utils'

local function render_digits(digits)
  return '{ ' .. table.concat(utils.map(digits, tostring), ', ') .. ' }'
end

return {
  module_name = 'all_your_base',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          all_your_base.convert(%s, %d).to(%d)
        end)]]
      return template:format(render_digits(case.input.digits), case.input.inputBase, case.input.outputBase)
    end

    local template = [[
      assert.are.same(%s, all_your_base.convert(%s, %d).to(%d))]]
    return template:format(render_digits(case.expected), render_digits(case.input.digits), case.input.inputBase,
                           case.input.outputBase)
  end
}
