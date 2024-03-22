local crypto_square = require('crypto-square')

describe('crypto-square', function()
  it('empty plaintext results in an empty ciphertext', function()
    assert.are.equal('', crypto_square.ciphertext(''))
  end)

  it('normalization results in empty plaintext', function()
    assert.are.equal('', crypto_square.ciphertext('... --- ...'))
  end)

  it('Lowercase', function()
    assert.are.equal('a', crypto_square.ciphertext('A'))
  end)

  it('Remove spaces', function()
    assert.are.equal('b', crypto_square.ciphertext('  b '))
  end)

  it('Remove punctuation', function()
    assert.are.equal('1', crypto_square.ciphertext('@1,%!'))
  end)

  it('9 character plaintext results in 3 chunks of 3 characters', function()
    assert.are.equal('tsf hiu isn', crypto_square.ciphertext('This is fun!'))
  end)

  it('8 character plaintext results in 3 chunks, the last one with a trailing space', function()
    assert.are.equal('clu hlt io ', crypto_square.ciphertext('Chill out.'))
  end)

  it('54 character plaintext results in 7 chunks, the last two with trailing spaces', function()
    assert.are.equal('imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ',
                     crypto_square.ciphertext('If man was meant to stay on the ground, god would have given us roots.'))
  end)
end)
