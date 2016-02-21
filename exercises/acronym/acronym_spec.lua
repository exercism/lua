local acronym = require('acronym')

describe('acronym', function()
  it('should generate single-letter acronyms', function()
    assert.equal('L', acronym('Lua'))
  end)

  it('should generate multi-letter acronyms', function()
    assert.equal('LUA', acronym('Lua Ultimate Acronym'))
  end)

  it('should include lowercase words', function()
    assert.equal('ROR', acronym('Ruby on Rails'))
  end)

  it('should ignore punctuation', function()
    assert.equal('FIFO', acronym('First In, First Out'))
  end)

  it('should split words with internal capitalization', function()
    assert.equal('HTML', acronym('HyperText Markup Language'))
  end)

  it('should not split words that are all uppercase', function()
    assert.equal('PHP', acronym('PHP: Hypertext Processor'))
  end)
end)
