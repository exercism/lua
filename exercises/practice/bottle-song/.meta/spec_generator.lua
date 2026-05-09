local utils = require 'utils'

return {
  module_name = 'BottleSong',

  generate_test = function(case)
    local template = [[
      local expected = table.concat({ %s })
      assert.equal(expected, BottleSong.%s(%s, %s))]]

    local expected = table.concat(utils.map(case.expected, function(x)
      return utils.stringify(x .. '\n')
    end), ', ')
    return template:format(expected, utils.snake_case(case.property), case.input.startBottles, case.input.takeDown)
  end
}
