local utils = require 'utils'

return {
  module_name = 'lsp',

  generate_test = function(case)
    if type(case.expected) == 'table' then
      local template = [[
        assert.has_error(function()
          lsp({ digits = %s, span = %d })
        end)]]
      return template:format(utils.stringify(case.input.digits), case.input.span)
    end

    local template = [[
      assert.equal(%d, lsp({ digits = %s, span = %d }))]]
    return template:format(case.expected, utils.stringify(case.input.digits), case.input.span)
  end
}
