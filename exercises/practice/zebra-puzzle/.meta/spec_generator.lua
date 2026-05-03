local utils = require 'utils'

return {
  module_name = 'zebra_puzzle',

  generate_test = function(case)
    local template = [[
      assert.equal('%s', zebra_puzzle.%s())]]
    return template:format(case.expected, utils.snake_case(case.property))
  end
}
