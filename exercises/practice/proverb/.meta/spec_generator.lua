local utils = require 'utils'

return {
  module_name = 'Proverb',

  generate_test = function(case)
    local template = [[
      local strings = { %s }
      local expected = table.concat({ %s })
      assert.equal(expected, Proverb.%s(strings))]]

    local strings = table.concat(utils.map(case.input.strings, utils.stringify), ', ')
    local expected = table.concat(utils.map(case.expected, function(x)
      return utils.stringify(x .. '\n')
    end), ', ')
    return template:format(strings, expected, utils.snake_case(case.property))
  end
}
