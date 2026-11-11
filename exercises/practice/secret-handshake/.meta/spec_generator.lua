local utils = require 'utils'

return {
  module_name = 'secret_handshake',

  generate_test = function(case)
    local template = [[
      assert.are.same({ %s }, secret_handshake(%d))]]
    return template:format(table.concat(utils.map(case.expected, utils.stringify), ', '), case.input.number)
  end
}
