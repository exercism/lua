local isbn_verifier = require('isbn-verifier')

describe('isbn-verifier', function()
  it('valid isbn', function()
    assert.is_true(isbn_verifier.valid('3-598-21508-8'))
  end)

  it('invalid isbn check digit', function()
    assert.is_false(isbn_verifier.valid('3-598-21508-9'))
  end)

  it('valid isbn with a check digit of 10', function()
    assert.is_true(isbn_verifier.valid('3-598-21507-X'))
  end)

  it('check digit is a character other than x', function()
    assert.is_false(isbn_verifier.valid('3-598-21507-A'))
  end)

  it('invalid check digit in isbn is not treated as zero', function()
    assert.is_false(isbn_verifier.valid('4-598-21507-B'))
  end)

  it('invalid character in isbn is not treated as zero', function()
    assert.is_false(isbn_verifier.valid('3-598-P1581-X'))
  end)

  it('x is only valid as a check digit', function()
    assert.is_false(isbn_verifier.valid('3-598-2X507-9'))
  end)

  it('only one check digit is allowed', function()
    assert.is_false(isbn_verifier.valid('3-598-21508-96'))
  end)

  it('x is not substituted by the value 10', function()
    assert.is_false(isbn_verifier.valid('3-598-2X507-5'))
  end)

  it('valid isbn without separating dashes', function()
    assert.is_true(isbn_verifier.valid('3598215088'))
  end)

  it('isbn without separating dashes and x as check digit', function()
    assert.is_true(isbn_verifier.valid('359821507X'))
  end)

  it('isbn without check digit and dashes', function()
    assert.is_false(isbn_verifier.valid('359821507'))
  end)

  it('too long isbn and no dashes', function()
    assert.is_false(isbn_verifier.valid('3598215078X'))
  end)

  it('too short isbn', function()
    assert.is_false(isbn_verifier.valid('00'))
  end)

  it('isbn without check digit', function()
    assert.is_false(isbn_verifier.valid('3-598-21507'))
  end)

  it('check digit of x should not be used for 0', function()
    assert.is_false(isbn_verifier.valid('3-598-21515-X'))
  end)

  it('empty isbn', function()
    assert.is_false(isbn_verifier.valid(''))
  end)

  it('input is 9 characters', function()
    assert.is_false(isbn_verifier.valid('134456729'))
  end)

  it('invalid characters are not ignored after checking length', function()
    assert.is_false(isbn_verifier.valid('3132P34035'))
  end)

  it('invalid characters are not ignored before checking length', function()
    assert.is_false(isbn_verifier.valid('3598P215088'))
  end)

  it('input is too long but contains a valid isbn', function()
    assert.is_false(isbn_verifier.valid('98245726788'))
  end)
end)
