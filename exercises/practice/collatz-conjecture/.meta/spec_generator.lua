local utils = require 'utils'

return {
  module_name = 'conjecture',

  generate_test = function(case)
    if type(case.expected) == 'table' then
      local template = [[
        assert.has_error(function() conjecture(%s) end)]]
      return template:format(case.input.number)
    else
      local template = [[
      assert.are.equal(%s, conjecture(%s))]]
      return template:format(case.expected, case.input.number)
    end
  end
}
