local hello_world = require('hello-world')

describe('hello-world', function()

  it('says hello world with no name', function()
    local result = hello_world.hello()
    assert.are.equals('Hello, world!', result)
  end)

  it('says hello to Bob', function()
    local result = hello_world.hello('Bob')
    assert.are.equals('Hello, Bob!', result)
  end)

  it('says hello to Sally', function()
    local result = hello_world.hello('Sally')
    assert.are.equals('Hello, Sally!', result)
  end)
end)
