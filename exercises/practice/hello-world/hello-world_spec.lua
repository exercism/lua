local hello_world = require('hello-world')

describe('hello-world', function()
  -- Define a module named hello-world. This module should return a single
  -- function named hello that takes no arguments and returns a string.

  it('say hi!', function()
    assert.are.equal('Hello, World!', hello_world.hello())
  end)
end)
