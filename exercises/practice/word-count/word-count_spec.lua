local word_count = require('word-count')

describe('word-count', function()
  it('count one word', function()
    local result = word_count.count_words('word')
    local expected = { ['word'] = 1 }
    assert.are.same(expected, result)
  end)

  it('count one of each word', function()
    local result = word_count.count_words('one of each')
    local expected = { ['each'] = 1, ['of'] = 1, ['one'] = 1 }
    assert.are.same(expected, result)
  end)

  it('multiple occurrences of a word', function()
    local result = word_count.count_words('one fish two fish red fish blue fish')
    local expected = { ['blue'] = 1, ['fish'] = 4, ['one'] = 1, ['red'] = 1, ['two'] = 1 }
    assert.are.same(expected, result)
  end)

  it('handles cramped lists', function()
    local result = word_count.count_words('one,two,three')
    local expected = { ['one'] = 1, ['three'] = 1, ['two'] = 1 }
    assert.are.same(expected, result)
  end)

  it('handles expanded lists', function()
    local result = word_count.count_words('one,\ntwo,\nthree')
    local expected = { ['one'] = 1, ['three'] = 1, ['two'] = 1 }
    assert.are.same(expected, result)
  end)

  it('ignore punctuation', function()
    local result = word_count.count_words('car: carpet as java: javascript!!&@$%^&')
    local expected = { ['as'] = 1, ['car'] = 1, ['carpet'] = 1, ['java'] = 1, ['javascript'] = 1 }
    assert.are.same(expected, result)
  end)

  it('include numbers', function()
    local result = word_count.count_words('testing, 1, 2 testing')
    local expected = { ['1'] = 1, ['2'] = 1, ['testing'] = 2 }
    assert.are.same(expected, result)
  end)

  it('normalize case', function()
    local result = word_count.count_words('go Go GO Stop stop')
    local expected = { ['go'] = 3, ['stop'] = 2 }
    assert.are.same(expected, result)
  end)

  it('with apostrophes', function()
    local result = word_count.count_words("'First: don't laugh. Then: don't cry. You're getting it.'")
    local expected = {
      ["don't"] = 2,
      ["you're"] = 1,
      ['cry'] = 1,
      ['first'] = 1,
      ['getting'] = 1,
      ['it'] = 1,
      ['laugh'] = 1,
      ['then'] = 1
    }
    assert.are.same(expected, result)
  end)

  it('with quotations', function()
    local result = word_count.count_words("Joe can't tell between 'large' and large.")
    local expected = { ["can't"] = 1, ['and'] = 1, ['between'] = 1, ['joe'] = 1, ['large'] = 2, ['tell'] = 1 }
    assert.are.same(expected, result)
  end)

  it('substrings from the beginning', function()
    local result = word_count.count_words("Joe can't tell between app, apple and a.")
    local expected = {
      ["can't"] = 1,
      ['a'] = 1,
      ['and'] = 1,
      ['app'] = 1,
      ['apple'] = 1,
      ['between'] = 1,
      ['joe'] = 1,
      ['tell'] = 1
    }
    assert.are.same(expected, result)
  end)

  it('multiple spaces not detected as a word', function()
    local result = word_count.count_words(' multiple   whitespaces')
    local expected = { ['multiple'] = 1, ['whitespaces'] = 1 }
    assert.are.same(expected, result)
  end)

  it('alternating word separators not detected as a word', function()
    local result = word_count.count_words(",\n,one,\n ,two \n 'three'")
    local expected = { ['one'] = 1, ['three'] = 1, ['two'] = 1 }
    assert.are.same(expected, result)
  end)

  it('quotation for word with apostrophe', function()
    local result = word_count.count_words("can, can't, 'can't'")
    local expected = { ["can't"] = 2, ['can'] = 1 }
    assert.are.same(expected, result)
  end)
end)
