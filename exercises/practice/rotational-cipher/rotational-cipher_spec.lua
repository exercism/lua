local rotational_cipher = require('rotational-cipher')

describe('rotational-cipher', function()
  it('rotate a by 0, same output as input', function()
    assert.are.equal('a', rotational_cipher.rotate('a', 0))
  end)

  it('rotate a by 1', function()
    assert.are.equal('b', rotational_cipher.rotate('a', 1))
  end)

  it('rotate a by 26, same output as input', function()
    assert.are.equal('a', rotational_cipher.rotate('a', 26))
  end)

  it('rotate m by 13', function()
    assert.are.equal('z', rotational_cipher.rotate('m', 13))
  end)

  it('rotate n by 13 with wrap around alphabet', function()
    assert.are.equal('a', rotational_cipher.rotate('n', 13))
  end)

  it('rotate capital letters', function()
    assert.are.equal('TRL', rotational_cipher.rotate('OMG', 5))
  end)

  it('rotate spaces', function()
    assert.are.equal('T R L', rotational_cipher.rotate('O M G', 5))
  end)

  it('rotate numbers', function()
    assert.are.equal('Xiwxmrk 1 2 3 xiwxmrk', rotational_cipher.rotate('Testing 1 2 3 testing', 4))
  end)

  it('rotate punctuation', function()
    assert.are.equal('Gzo\'n zvo, Bmviyhv!', rotational_cipher.rotate('Let\'s eat, Grandma!', 21))
  end)

  it('rotate all letters', function()
    assert.are.equal('Gur dhvpx oebja sbk whzcf bire gur ynml qbt.',
                     rotational_cipher.rotate('The quick brown fox jumps over the lazy dog.', 13))
  end)
end)
