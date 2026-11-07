local is_pangram = require('pangram')

describe('pangram', function()
  it('empty sentence', function()
    assert.is_false(is_pangram(''))
  end)

  it('perfect lower case', function()
    assert.is_true(is_pangram('abcdefghijklmnopqrstuvwxyz'))
  end)

  it('only lower case', function()
    assert.is_true(is_pangram('the quick brown fox jumps over the lazy dog'))
  end)

  it("missing the letter 'x'", function()
    assert.is_false(is_pangram('a quick movement of the enemy will jeopardize five gunboats'))
  end)

  it("missing the letter 'h'", function()
    assert.is_false(is_pangram('five boxing wizards jump quickly at it'))
  end)

  it('with underscores', function()
    assert.is_true(is_pangram('the_quick_brown_fox_jumps_over_the_lazy_dog'))
  end)

  it('with numbers', function()
    assert.is_true(is_pangram('the 1 quick brown fox jumps over the 2 lazy dogs'))
  end)

  it('missing letters replaced by numbers', function()
    assert.is_false(is_pangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'))
  end)

  it('mixed case and punctuation', function()
    assert.is_true(is_pangram('"Five quacking Zephyrs jolt my wax bed."'))
  end)

  it('a-m and a-m are 26 different characters but not a pangram', function()
    assert.is_false(is_pangram('abcdefghijklm ABCDEFGHIJKLM'))
  end)
end)
