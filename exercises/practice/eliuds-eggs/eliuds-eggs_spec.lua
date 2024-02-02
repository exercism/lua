local EliudsEggs = require 'eliuds-eggs'

describe('eliuds-eggs', function()
  it('0 eggs', function()
    assert.equal(0, EliudsEggs.egg_count(0))
  end)

  it('1 egg', function()
    assert.equal(1, EliudsEggs.egg_count(16))
  end)

  it('4 eggs', function()
    assert.equal(4, EliudsEggs.egg_count(89))
  end)

  it('13 eggs', function()
    assert.equal(13, EliudsEggs.egg_count(2000000000))
  end)
end)
