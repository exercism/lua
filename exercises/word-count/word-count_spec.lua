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
    local result = word_count('go Go GO')
    local expected = { go = 3 }
    assert.are.same(expected, result)
  end)
end)
