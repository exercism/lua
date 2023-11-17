local TwoFer = require 'two-fer'

describe('two-fer', function()
  it('no name given', function()
    assert.equal('One for you, one for me.', TwoFer.two_fer())
  end)

  it('a name given', function()
    assert.equal('One for Alice, one for me.', TwoFer.two_fer('Alice'))
  end)

  it('another name given', function()
    assert.equal('One for Bob, one for me.', TwoFer.two_fer('Bob'))
  end)
end)
