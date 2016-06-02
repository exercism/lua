local is_pangram = require('pangram')

describe('pangram', function()
  it('should not consider the empty string to be a pangram', function()
    assert.is_false(is_pangram(''))
  end)

  it('should not consider a sentence with 26 of the same letter to be a pangram', function()
    assert.is_false(is_pangram(string.rep('a', 26)))
  end)

  it('should consider the alphabet to be a pangram', function()
    assert.is_true(is_pangram('abcdefghijklmnopqrstuvwxyz'))
  end)

  it('should consider a sentence with one of each letter to be a pangram', function()
    assert.is_true(is_pangram('the quick brown fox jumps over the lazy dog'))
  end)

  it('should allow mixed case in pangrams', function()
    assert.is_true(is_pangram('The Quick Brown Fox Jumps Over The Lazy Dog'))
  end)

  it('should allow punctuation in pangrams', function()
    assert.is_true(is_pangram('the.quick.brown.fox.jumps.over.the.lazy.dog'))
  end)

  it('should allow underscores in pangrams', function()
    assert.is_true(is_pangram('the_quick_brown_fox_jumps_over_the_lazy.dog'))
  end)

  it('should allow numbers in pangrams', function()
    assert.is_true(is_pangram('the 1 quick brown fox jumps over the 2 lazy dogs'))
  end)

  it('should not allow letters in pangrams to be replaced by numbers', function()
    assert.is_false(is_pangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'))
  end)

  it('should not consider a sentence with only 25 unique letters to be a pangram', function()
    assert.is_false(is_pangram('a quick movement of the enemy will jeopardize five gunboats'))
    assert.is_false(is_pangram('the quick brown fish jumps over the lazy dog'))
  end)

  it('should allow non-ASCII characters in pangrams', function()
    assert.is_true(is_pangram('Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich.'))
  end)

  it('should not consider non-ASCII characters to be letters', function()
    assert.is_false(is_pangram('äbcdefghijklmnopqrstuvwxyz'))
  end)
end)
