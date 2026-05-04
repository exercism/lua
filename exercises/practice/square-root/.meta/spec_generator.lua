local utils = require 'utils'

return {
  module_name = 'SquareRoot',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, SquareRoot.%s(%s))]]

    return template:format(tostring(case.expected), utils.snake_case(case.property), case.input.radicand)
  end
}
