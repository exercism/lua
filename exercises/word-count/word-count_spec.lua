
-- problem specification version 1.4.0

local word_count = require('word-count').word_count

describe('word-count', function()
  it('counts one word', function()
    local result = word_count('word')
    local expected = { word = 1 }
    assert.are.same(expected, result)
  end)

  it('counts one of each', function()
    local result = word_count('one of each')
    local expected = { one = 1, of = 1, each = 1 }
    assert.are.same(expected, result)
  end)

  it('counts multiple occurrences', function()
    local result = word_count('one fish two fish red fish blue fish')
    local expected = { one = 1, fish = 4, two = 1, red = 1, blue = 1 }
    assert.are.same(expected, result)
  end)

  it('handles cramped lists', function()
    local result = word_count('one,two,three')
    local expected = { one = 1, two = 1, three = 1}
    assert.are.same(expected, result)
  end)

  it('handles expanded lists', function()
    local result = word_count('one,\ntwo,\nthree')
    local expected = { one = 1, two = 1, three = 1}
    assert.are.same(expected, result)
  end)

  it('ignores punctuation', function()
    local result = word_count('car : carpet as java : javascript!!&@$%^&')
    local expected = { car = 1, carpet = 1, as = 1, java = 1, javascript = 1 }
    assert.are.same(expected, result)
  end)

  it('includes numbers', function()
    local result = word_count('testing, 1, 2 testing')
    local expected = { testing = 2, ['1'] = 1, ['2'] = 1 }
    assert.are.same(expected, result)
  end)

  it('normalizes case', function()
    local result = word_count('go Go GO Stop stop')
    local expected = { go = 3, stop = 2 }
    assert.are.same(expected, result)
  end)

  it('counts with apostrophes', function()
    local result = word_count("First: don't laugh. Then: don't cry.")
    local expected = { first = 1, ["don't"] = 2, laugh = 1, ['then'] = 1, cry = 1}
    assert.are.same(expected, result)
  end)

  it('counts with quotation', function()
    local result = word_count("Joe can't tell between 'large' and large.")
    local expected = { joe = 1, ["can't"] = 1, tell = 1, between = 1, large = 2, ["and"] = 1}
    assert.are.same(expected, result)
  end)

  it('counts with substrings from the beginning', function()
    local result = word_count("Joe can't tell between app, apple and a.")
    local expected = { joe = 1, ["can't"] = 1, tell = 1, between = 1, app = 1, apple = 1, ["and"] = 1, a = 1}
    assert.are.same(expected, result)
  end)

  it('does not count multiple spaces as a word', function()
    local result = word_count(' multiple   whitespaces')
    local expected = {multiple = 1, whitespaces = 1}
    assert.are.same(expected, result)
  end)

  it('alternating word separators not detected as a word', function()
    local result = word_count(",\n,one,\n ,two \n 'three'")
    local expected = {one = 1, two = 1, three = 1}
    assert.are.same(expected, result)
  end)
end)
