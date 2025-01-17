local Anagram = require('anagram')

describe('anagram', function()
  local function sorted_clone(t)
    local clone = {}
    for k, v in pairs(t) do
      clone[k] = v
    end
    table.sort(clone)
    return clone
  end

  local function assert_lists_are_same(expected, actual)
    assert.are.same(sorted_clone(expected), sorted_clone(actual))
  end

  it('no result', function()
    local detector = Anagram:new('diaper')
    local result = detector:match({ 'hello', 'world', 'zombies', 'pants' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('detects simple anagram', function()
    local detector = Anagram:new('ant')
    local result = detector:match({ 'tan', 'stand', 'at' })
    local expected = { 'tan' }
    assert_lists_are_same(expected, result)
  end)

  it('does not detect false positives', function()
    local detector = Anagram:new('galea')
    local result = detector:match({ 'eagle' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('detects multiple anagrams', function()
    local detector = Anagram:new('master')
    local result = detector:match({ 'stream', 'pigeon', 'maters' })
    local expected = { 'stream', 'maters' }
    assert_lists_are_same(expected, result)
  end)

  it('does not detect anagram subsets', function()
    local detector = Anagram:new('good')
    local result = detector:match({ 'dog', 'goody' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('detects anagram', function()
    local detector = Anagram:new('listen')
    local result = detector:match({ 'enlists', 'google', 'inlets', 'banana' })
    local expected = { 'inlets' }
    assert_lists_are_same(expected, result)
  end)

  it('detects multiple anagrams', function()
    local detector = Anagram:new('allergy')
    local result = detector:match({ 'gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading' })
    local expected = { 'gallery', 'regally', 'largely' }
    assert_lists_are_same(expected, result)
  end)

  it('detects anagrams case-insensitively', function()
    local detector = Anagram:new('Orchestra')
    local result = detector:match({ 'cashregister', 'Carthorse', 'radishes' })
    local expected = { 'Carthorse' }
    assert_lists_are_same(expected, result)
  end)
end)
