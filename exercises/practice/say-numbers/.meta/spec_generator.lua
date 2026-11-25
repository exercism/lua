local utils = require 'utils'

return {
  module_name = 'say',

  generate_test = function(case)
    if type(case.expected) == 'table' then
      local template = [[
        assert.has_error(function()
          say(%d)
        end)]]
      return template:format(case.input.number)
    end

    return ('assert.are.equal(%s, say(%d))'):format(utils.stringify(case.expected), case.input.number)
  end
}
