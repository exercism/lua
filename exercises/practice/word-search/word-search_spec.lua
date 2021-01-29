local WordSearch = require('word-search')

describe('word-search', function()
  local puzzle = {
    'jefblpepre',
    'camdcimgtc',
    'oivokprjsm',
    'pbwasqroua',
    'rixilelhrs',
    'wolcqlirpc',
    'screeaumgr',
    'alxhpburyi',
    'jalaycalmp',
    'clojurermt',
  }

  it('should find horizontal words written left-to-right', function()
    local first, last = WordSearch(puzzle).find('clojure')
    assert.same({ 1, 10 }, first)
    assert.same({ 7, 10 }, last)
  end)

  it('should find horizontal words written right-to-left', function()
    local first, last = WordSearch(puzzle).find('elixir')
    assert.same({ 6, 5 }, first)
    assert.same({ 1, 5 }, last)
  end)

  it('should find vertical words written top-to-bottom', function()
    local first, last = WordSearch(puzzle).find('ecmascript')
    assert.same({ 10, 1 }, first)
    assert.same({ 10, 10 }, last)
  end)

  it('should find vertical words written bottom-to-top', function()
    local first, last = WordSearch(puzzle).find('rust')
    assert.same({ 9, 5 }, first)
    assert.same({ 9, 2 }, last)
  end)

  it('should find diagonal words written top-left-to-bottom-right', function()
    local first, last = WordSearch(puzzle).find('java')
    assert.same({ 1, 1 }, first)
    assert.same({ 4, 4 }, last)
  end)

  it('should find diagonal upper written bottom-right-to-top-left', function()
    local first, last = WordSearch(puzzle).find('lua')
    assert.same({ 8, 9 }, first)
    assert.same({ 6, 7 }, last)
  end)

  it('should find diagonal upper written bottom-left-to-top-right', function()
    local first, last = WordSearch(puzzle).find('lisp')
    assert.same({ 3, 6 }, first)
    assert.same({ 6, 3 }, last)
  end)

  it('should find diagonal upper written top-right-to-bottom-left', function()
    local first, last = WordSearch(puzzle).find('ruby')
    assert.same({ 8, 6 }, first)
    assert.same({ 5, 9 }, last)
  end)

  it('should not find words that are not in the puzzle', function()
    local first, last = WordSearch(puzzle).find('haskell')
    assert.same(nil, first)
    assert.same(nil, last)
  end)

  it('should be able to search differently-sized puzzles', function()
    local puzzle = {
      'qwertyuiopz',
      'luamsicrexe',
      'abcdefghijk'
    }
    local first, last = WordSearch(puzzle).find('exercism')
    assert.same({ 11, 2 }, first)
    assert.same({ 4, 2 }, last)
  end)
end)
