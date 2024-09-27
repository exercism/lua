local Proverb = require 'proverb'

describe('proverb', function()
  it('zero pieces', function()
    strings = {}
    expected = table.concat({})
    assert.equal(expected, Proverb.recite(strings))
  end)

  it('one piece', function()
    strings = { 'nail' }
    expected = table.concat({ "And all for the want of a nail.\n" })
    assert.equal(expected, Proverb.recite(strings))
  end)

  it('two pieces', function()
    strings = { 'nail', 'shoe' }
    expected = table.concat({ "For want of a nail the shoe was lost.\n", "And all for the want of a nail.\n" })
    assert.equal(expected, Proverb.recite(strings))
  end)

  it('three pieces', function()
    strings = { 'nail', 'shoe', 'horse' }
    expected = table.concat({
      "For want of a nail the shoe was lost.\n",
      "For want of a shoe the horse was lost.\n",
      "And all for the want of a nail.\n"
    })
    assert.equal(expected, Proverb.recite(strings))
  end)

  it('full proverb', function()
    strings = { 'nail', 'shoe', 'horse', 'rider', 'message', 'battle', 'kingdom' }
    expected = table.concat({
      "For want of a nail the shoe was lost.\n",
      "For want of a shoe the horse was lost.\n",
      "For want of a horse the rider was lost.\n",
      "For want of a rider the message was lost.\n",
      "For want of a message the battle was lost.\n",
      "For want of a battle the kingdom was lost.\n",
      "And all for the want of a nail.\n"
    })
    assert.equal(expected, Proverb.recite(strings))
  end)

  it('four pieces modernized', function()
    strings = { 'pin', 'gun', 'soldier', 'battle' }
    expected = table.concat({
      "For want of a pin the gun was lost.\n",
      "For want of a gun the soldier was lost.\n",
      "For want of a soldier the battle was lost.\n",
      "And all for the want of a pin.\n"
    })
    assert.equal(expected, Proverb.recite(strings))
  end)
end)
