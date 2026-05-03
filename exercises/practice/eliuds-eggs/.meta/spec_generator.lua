local utils = require 'utils'

return {
  module_name = 'EliudsEggs',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, EliudsEggs.%s(%s))]]
    return template:format(case.expected, utils.snake_case(case.property), case.input.number)
  end
}
