local utils = require 'utils'

return {
  module_name = 'brackets',

  generate_test = function(case)
    local template = [[
      assert.is_%s(brackets.valid(%s))]]
    return template:format(case.expected, utils.stringify(case.input.value))
  end
}
