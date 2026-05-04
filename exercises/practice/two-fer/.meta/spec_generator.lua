local utils = require 'utils'

return {
  module_name = 'TwoFer',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, TwoFer.%s(%s))]]

    local name = case.input.name and utils.stringify(case.input.name) or ''
    return template:format(utils.stringify(case.expected), utils.snake_case(case.property), name)
  end
}
