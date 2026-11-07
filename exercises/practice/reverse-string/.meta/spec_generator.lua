local utils = require 'utils'

return {
  module_name = 'reverse_string',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%s, reverse_string(%s))]]
    return template:format(utils.stringify(case.expected), utils.stringify(case.input.value))
  end
}
