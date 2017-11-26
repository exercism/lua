local valid = require('isbn-verifier').valid

describe('isbn-verifier', function()
  it('valid isbn number', function()
    assert.is_true(valid('3-598-21508-8'))
  end)

  it('invalid isbn check digit', function()
    assert.is_false(valid('3-598-21508-9'))
  end)

  it('valid isbn number with a check digit of 10', function()
    assert.is_true(valid('3-598-21507-X'))
  end)

  it('check digit is a character other than X', function()
    assert.is_false(valid('3-598-21507-A'))
  end)

  it('invalid character in isbn', function()
    assert.is_false(valid('3-598-2K507-0'))
  end)

  it('X is only valid as a check digit', function()
    assert.is_false(valid('3-598-2X507-9'))
  end)

  it('valid isbn without separating dashes', function()
    assert.is_true(valid('3598215088'))
  end)

  it('isbn without separating dashes and X as check digit', function()
    assert.is_true(valid('359821507X'))
  end)

  it('isbn without check digit and dashes', function()
    assert.is_false(valid('359821507'))
  end)

  it('too long isbn and no dashes', function()
    assert.is_false(valid('3598215078X'))
  end)

  it('isbn without check digit', function()
    assert.is_false(valid('3-598-21507'))
  end)

  it('too long isbn', function()
    assert.is_false(valid('3-598-21507-XX'))
  end)

  it('check digit of X should not be used for 0', function()
    assert.is_false(valid('3-598-21515-X'))
  end)
end)
