local utils = require 'utils'

return {
  module_name = 'rfc',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%s, rfc.%s(%s, %d))]]
    return template:format(utils.stringify(case.expected), case.property, utils.stringify(case.input.msg),
                           case.input.rails)
  end
}
