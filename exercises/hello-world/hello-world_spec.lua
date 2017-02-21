-- Require the hello-world module
local hello_world = require('hello-world')

-- Define a module named hello-world. This module should return a single
-- function named hello that takes no arguments and returns a string.

describe('hello-world', function()
  it('says hello world', function()
    local result = hello_world.hello()
    assert.are.equal('Hello, World!', result)
  end)
end)
