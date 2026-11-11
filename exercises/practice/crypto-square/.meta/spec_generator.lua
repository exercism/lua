local utils = require 'utils'

return {
  module_name = 'crypto_square',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%s, crypto_square.ciphertext(%s))]]
    return template:format(utils.stringify(case.expected), utils.stringify(case.input.plaintext))
  end
}
