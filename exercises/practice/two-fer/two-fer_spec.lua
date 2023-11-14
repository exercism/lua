local TwoFer = require 'two-fer'

describe('two-fer', function()
  it('no name given', function()
    assert.equal('One for you, one for me.', TwoFer.twoFer())
  end)

  it('a name given', function()
    assert.equal('One for Alice, one for me.', TwoFer.twoFer('Alice'))
  end)

  it('another name given', function()
    assert.equal('One for Bob, one for me.', TwoFer.twoFer('Bob'))
  end)
end)
