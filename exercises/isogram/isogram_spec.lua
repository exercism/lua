local is_isogram = require 'isogram'

describe('isogram', function()
  it('should identify simple isograms', function()
    assert.is_true(is_isogram('duplicates'))
    assert.is_true(is_isogram('subdermatoglyphic'))
  end)

  it('should identify words with repeated letters as non-isograms', function()
    assert.is_false(is_isogram('eleven'))
  end)

  it('should be case insensitive', function()
    assert.is_false(is_isogram('Alphabet'))
  end)

  it('should allow punctuations in isograms', function()
    assert.is_true(is_isogram('thumbscrew-japingly'))
  end)

  it('should allow repeated punctuation in isograms', function()
    assert.is_true(is_isogram('Hjelmqvist-Gryb-Zock-Pfund-Wax'))
  end)

  it('should identify non-isogram sentences', function()
    assert.is_false(is_isogram('the quick brown fox'))
  end)

  it('should identify isogram sentences', function()
    assert.is_true(is_isogram('Emily Jung Schwartzkopf'))
  end)
end)
