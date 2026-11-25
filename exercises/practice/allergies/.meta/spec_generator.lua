local utils = require 'utils'

return {
  module_name = 'allergies',

  generate_test = function(case)
    if case.property == 'allergicTo' then
      local template = [[
        assert.is_%s(allergies.allergic_to(%d, %s))]]
      return template:format(case.expected, case.input.score, utils.stringify(case.input.item))
    end

    local template = [[
      local expected = { %s }
      assert.are.same(expected, allergies.list(%d))]]
    return template:format(table.concat(utils.map(case.expected, utils.stringify), ', '), case.input.score)
  end
}
