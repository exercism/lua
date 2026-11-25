local utils = require 'utils'

return {
  module_name = 'Matrix',

  generate_test = function(case)
    local template = [[
      local matrix = Matrix(%s)
      assert.are.same({ %s }, matrix.%s(%d))]]
    return template:format(utils.stringify(case.input.string), table.concat(case.expected, ', '), case.property,
                           case.input.index)
  end
}
