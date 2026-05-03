local utils = require 'utils'

return {
  module_name = 'diff',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, diff.%s(%s))]]
    return template:format(case.expected, utils.snake_case(case.property), case.input.number)
  end
}
