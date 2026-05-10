local utils = require 'utils'

return {
  module_name = 'IntergalacticTransmission',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function() IntergalacticTransmission.%s({ %s }) end, %s)]]
      return template:format(utils.snake_case(case.property), table.concat(case.input.message, ', --\n'),
                             utils.stringify(case.expected.error))
    else
      local template = [[
        local expected = { %s }
        local actual = IntergalacticTransmission.%s({ %s })
        assert.are.same(expected, actual)]]
      return template:format(table.concat(case.expected, ', --\n'), utils.snake_case(case.property),
                             table.concat(case.input.message, ', --\n'))
    end
  end
}
