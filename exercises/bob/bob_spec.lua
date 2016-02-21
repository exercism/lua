local bob = require('bob')

describe('bob', function()
  it('stating something', function()
    local result = bob.hey('Tom-ay-to, tom-aaaah-to.')
    assert.are.equals('Whatever', result)
  end)

  it('shouting', function ()
    local result = bob.hey('WATCH OUT!')
    assert.are.equals('Whoa, chill out!', result)
  end)

  it('asking a question', function ()
    local result = bob.hey('Does this cryogenic chamber make me look fat?')
    assert.are.equals('Sure', result)
  end)

  it('talking forcefully', function ()
    local result = bob.hey("Let's go make out behind the gym!")
    assert.are.equals('Whatever', result)
  end)

  it('shouting numbers', function ()
    local result = bob.hey('1, 2, 3 GO!')
    assert.are.equals('Whoa, chill out!', result)
  end)

  it('shouting with special characters', function ()
    local result = bob.hey('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!')
    assert.are.equals('Whoa, chill out!', result)
  end)

  it('silence', function ()
    local result = bob.hey('')
    assert.are.equals('Fine, be that way.', result)
  end)
end)
