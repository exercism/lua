local crypto_square = require('crypto-square')

describe('crypto-square', function()
  it('empty plaintext results in an empty ciphertext', function()
    crypto_square.ciphertext('', '')
  end)

  it('normalization results in empty plaintext', function()
    crypto_square.ciphertext('... --- ...', '')
  end)

  it('Lowercase', function()
    crypto_square.ciphertext('A', 'a')
  end)

  it('Remove spaces', function()
    crypto_square.ciphertext('  b ', 'b')
  end)

  it('Remove punctuation', function()
    crypto_square.ciphertext('@1,%!', '1')
  end)

  it('9 character plaintext results in 3 chunks of 3 characters', function()
    crypto_square.ciphertext('This is fun!', 'tsf hiu isn')
  end)

  it('8 character plaintext results in 3 chunks, the last one with a trailing space', function()
    crypto_square.ciphertext('Chill out.', 'clu hlt io ')
  end)

  it('54 character plaintext results in 7 chunks, the last two with trailing spaces', function()
    crypto_square.ciphertext(
      'If man was meant to stay on the ground, god would have given us roots.',
      'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau '
    )
  end)
end)
