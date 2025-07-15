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

  it('no matches', function()
    local detector = Anagram:new('diaper')
    local result = detector:match({ 'hello', 'world', 'zombies', 'pants' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('detects two anagrams', function()
    local detector = Anagram:new('solemn')
    local result = detector:match({ 'lemons', 'cherry', 'melons' })
    local expected = { 'lemons', 'melons' }
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

  it('detects three anagrams', function()
    local detector = Anagram:new('allergy')
    local result = detector:match({ 'gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading' })
    local expected = { 'gallery', 'regally', 'largely' }
    assert_lists_are_same(expected, result)
  end)

  it('detects multiple anagrams with different case', function()
    local detector = Anagram:new('nose')
    local result = detector:match({ 'Eons', 'ONES' })
    local expected = { 'Eons', 'ONES' }
    assert_lists_are_same(expected, result)
  end)

  it('does not detect non-anagrams with identical checksum', function()
    local detector = Anagram:new('mass')
    local result = detector:match({ 'last' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('detects anagrams case-insensitively', function()
    local detector = Anagram:new('Orchestra')
    local result = detector:match({ 'cashregister', 'Carthorse', 'radishes' })
    local expected = { 'Carthorse' }
    assert_lists_are_same(expected, result)
  end)

  it('detects anagrams using case-insensitive subject', function()
    local detector = Anagram:new('Orchestra')
    local result = detector:match({ 'cashregister', 'carthorse', 'radishes' })
    local expected = { 'carthorse' }
    assert_lists_are_same(expected, result)
  end)

  it('detects anagrams using case-insensitive possible matches', function()
    local detector = Anagram:new('orchestra')
    local result = detector:match({ 'cashregister', 'Carthorse', 'radishes' })
    local expected = { 'Carthorse' }
    assert_lists_are_same(expected, result)
  end)

  it('does not detect an anagram if the original word is repeated', function()
    local detector = Anagram:new('go')
    local result = detector:match({ 'goGoGO' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('anagrams must use all letters exactly once', function()
    local detector = Anagram:new('tapper')
    local result = detector:match({ 'patter' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('words are not anagrams of themselves', function()
    local detector = Anagram:new('BANANA')
    local result = detector:match({ 'BANANA' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('words are not anagrams of themselves even if letter case is partially different', function()
    local detector = Anagram:new('BANANA')
    local result = detector:match({ 'Banana' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('words are not anagrams of themselves even if letter case is completely different', function()
    local detector = Anagram:new('BANANA')
    local result = detector:match({ 'banana' })
    local expected = {}
    assert_lists_are_same(expected, result)
  end)

  it('words other than themselves can be anagrams', function()
    local detector = Anagram:new('LISTEN')
    local result = detector:match({ 'LISTEN', 'Silent' })
    local expected = { 'Silent' }
    assert_lists_are_same(expected, result)
  end)
end)
