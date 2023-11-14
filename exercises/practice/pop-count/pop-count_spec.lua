local PopCount = require 'pop-count'

describe('pop-count', function()
  it('0 eggs', function()
    assert.equal(0, PopCount.eggCount(0))
  end)

  it('1 egg', function()
    assert.equal(1, PopCount.eggCount(16))
  end)

  it('4 eggs', function()
    assert.equal(4, PopCount.eggCount(89))
  end)

  it('13 eggs', function()
    assert.equal(13, PopCount.eggCount(2000000000))
  end)
end)