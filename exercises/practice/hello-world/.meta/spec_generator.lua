local utils = require 'utils'

return {
  module_name = 'hello_world',

  test_helpers = [[
    -- Define a module named hello-world. This module should return a single
    -- function named hello that takes no arguments and returns a string.
  ]],

  generate_test = function(case)
    return ('assert.are.equal(%s, hello_world.hello())'):format(utils.stringify(case.expected))
  end
}
