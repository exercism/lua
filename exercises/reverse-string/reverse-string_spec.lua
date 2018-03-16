local reverse_string = require('reverse-string')

describe('reverse-string', function()
  it('an empty string', function()
    assert.are.equal('', reverse_string(''))
  end)

  it('a word', function()
    assert.are.equal('tobor', reverse_string('robot'))
  end)

  it('a capitalized word', function()
    assert.are.equal('nemaR', reverse_string('Ramen'))
  end)

  it('a sentence with punctuation', function()
    assert.are.equal("!yrgnuh m'I", reverse_string("I'm hungry!"))
  end)

  it('a palindrome', function()
    assert.are.equal('racecar', reverse_string('racecar'))
  end)
end)
