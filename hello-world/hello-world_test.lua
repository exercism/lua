local HelloWorld = require('hello_world')

describe('Hello World', function()

  it('says hello world with no name', function()
    local result = HelloWorld.hello()
    assert.are.equals('Hello, world!', result)
  end)

  it('says hello to Bob', function()
    local result = HelloWorld.hello('Bob')
    assert.are.equals('Hello, Bob!', result)
  end)

  it('says hello to Sally', function()
    local result = HelloWorld.hello('Sally')
    assert.are.equals('Hello, Sally!', result)
  end)
end)
