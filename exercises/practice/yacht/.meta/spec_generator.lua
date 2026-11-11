local utils = require 'utils'

return {
  module_name = 'yacht',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%d, yacht.score({ %s }, %s))]]
    return template:format(case.expected, table.concat(case.input.dice, ', '), utils.stringify(case.input.category))
  end
}
