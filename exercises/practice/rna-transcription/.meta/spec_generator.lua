local utils = require 'utils'

return {
  module_name = 'to_rna',

  generate_test = function(case)
    local template = [[
      assert.are.equal(%s, to_rna(%s))]]
    return template:format(utils.stringify(case.expected), utils.stringify(case.input.dna))
  end
}
