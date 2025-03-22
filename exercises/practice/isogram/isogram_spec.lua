local is_isogram = require('isogram')

describe('isogram', function()
  it('empty string', function()
    assert.is_true(is_isogram(''))
  end)

  it('isogram with only lower case characters', function()
    assert.is_true(is_isogram('isogram'))
  end)

  it('word with one duplicated character', function()
    assert.is_false(is_isogram('eleven'))
  end)

  it('word with one duplicated character from the end of the alphabet', function()
    assert.is_false(is_isogram('zzyzx'))
  end)

  it('longest reported english isogram', function()
    assert.is_true(is_isogram('subdermatoglyphic'))
  end)

  it('word with duplicated character in mixed case', function()
    assert.is_false(is_isogram('Alphabet'))
  end)

  it('word with duplicated character in mixed case, lowercase first', function()
    assert.is_false(is_isogram('alphAbet'))
  end)

  it('hypothetical isogrammic word with hyphen', function()
    assert.is_true(is_isogram('thumbscrew-japingly'))
  end)

  it('hypothetical word with duplicated character following hyphen', function()
    assert.is_false(is_isogram('thumbscrew-jappingly'))
  end)

  it('isogram with duplicated hyphen', function()
    assert.is_true(is_isogram('six-year-old'))
  end)

  it('made-up name that is an isogram', function()
    assert.is_true(is_isogram('Emily Jung Schwartzkopf'))
  end)

  it('duplicated character in the middle', function()
    assert.is_false(is_isogram('accentor'))
  end)

  it('same first and last characters', function()
    assert.is_false(is_isogram('angola'))
  end)

  it('word with duplicated character and with two hyphens', function()
    assert.is_false(is_isogram('up-to-date'))
  end)
end)
