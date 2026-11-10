local utils = require 'utils'

return {
  module_name = 'is_pangram',

  generate_test = function(case)
    local template = [[
      assert.is_%s(is_pangram(%s))]]
    return template:format(case.expected, utils.stringify(case.input.sentence))
  end
}
