local WordSearch = require('word-search')

describe('word-search', function()
  it('should accept an initial game grid and a target search word', function()
    local grid = { --
      'jefblpepre'
    }
    local words = { --
      'clojure'
    }
    local expected = {}
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate one word written left to right', function()
    local grid = { --
      'clojurermt'
    }
    local words = { --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 1, 1 }, ['end'] = { 7, 1 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate the same word written left to right in a different position', function()
    local grid = { --
      'mtclojurer'
    }
    local words = { --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 3, 1 }, ['end'] = { 9, 1 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate a different left to right word', function()
    local grid = { --
      'coffeelplx'
    }
    local words = { --
      'coffee'
    }
    local expected = { --
      coffee = { start = { 1, 1 }, ['end'] = { 6, 1 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate that different left to right word in a different position', function()
    local grid = { --
      'xcoffeezlp'
    }
    local words = { --
      'coffee'
    }
    local expected = { --
      coffee = { start = { 2, 1 }, ['end'] = { 7, 1 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate a left to right word in two line grid', function()
    local grid = { --
      'jefblpepre', --
      'tclojurerm'
    }
    local words = { --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 2, 2 }, ['end'] = { 8, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate a left to right word in three line grid', function()
    local grid = { --
      'camdcimgtc', --
      'jefblpepre', --
      'clojurermt'
    }
    local words = { --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 1, 3 }, ['end'] = { 7, 3 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate a left to right word in ten line grid', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate that left to right word in a different position in a ten line grid', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'clojurermt', --
      'jalaycalmp'
    }
    local words = { --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 1, 9 }, ['end'] = { 7, 9 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate a different left to right word in a ten line grid', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'fortranftw', --
      'alxhpburyi', --
      'clojurermt', --
      'jalaycalmp'
    }
    local words = { --
      'fortran'
    }
    local expected = { --
      fortran = { start = { 1, 7 }, ['end'] = { 7, 7 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate multiple words', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'fortranftw', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'fortran', --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      fortran = { start = { 1, 7 }, ['end'] = { 7, 7 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate a single word written right to left', function()
    local grid = { --
      'rixilelhrs'
    }
    local words = { --
      'elixir'
    }
    local expected = { --
      elixir = { start = { 6, 1 }, ['end'] = { 1, 1 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate multiple words written in different horizontal directions', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'elixir', --
      'clojure'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate words written top to bottom', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate words written bottom to top', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript', --
      'rust'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }, --
      rust = { start = { 9, 5 }, ['end'] = { 9, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate words written top left to bottom right', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript', --
      'rust', --
      'java'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }, --
      java = { start = { 1, 1 }, ['end'] = { 4, 4 } }, --
      rust = { start = { 9, 5 }, ['end'] = { 9, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate words written bottom right to top left', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript', --
      'rust', --
      'java', --
      'lua'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }, --
      java = { start = { 1, 1 }, ['end'] = { 4, 4 } }, --
      lua = { start = { 8, 9 }, ['end'] = { 6, 7 } }, --
      rust = { start = { 9, 5 }, ['end'] = { 9, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate words written bottom left to top right', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript', --
      'rust', --
      'java', --
      'lua', --
      'lisp'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }, --
      java = { start = { 1, 1 }, ['end'] = { 4, 4 } }, --
      lisp = { start = { 3, 6 }, ['end'] = { 6, 3 } }, --
      lua = { start = { 8, 9 }, ['end'] = { 6, 7 } }, --
      rust = { start = { 9, 5 }, ['end'] = { 9, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should locate words written top right to bottom left', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript', --
      'rust', --
      'java', --
      'lua', --
      'lisp', --
      'ruby'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }, --
      java = { start = { 1, 1 }, ['end'] = { 4, 4 } }, --
      lisp = { start = { 3, 6 }, ['end'] = { 6, 3 } }, --
      lua = { start = { 8, 9 }, ['end'] = { 6, 7 } }, --
      ruby = { start = { 8, 6 }, ['end'] = { 5, 9 } }, --
      rust = { start = { 9, 5 }, ['end'] = { 9, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should fail to locate a word that is not in the puzzle', function()
    local grid = { --
      'jefblpepre', --
      'camdcimgtc', --
      'oivokprjsm', --
      'pbwasqroua', --
      'rixilelhrs', --
      'wolcqlirpc', --
      'screeaumgr', --
      'alxhpburyi', --
      'jalaycalmp', --
      'clojurermt'
    }
    local words = { --
      'clojure', --
      'elixir', --
      'ecmascript', --
      'rust', --
      'java', --
      'lua', --
      'lisp', --
      'ruby', --
      'haskell'
    }
    local expected = { --
      clojure = { start = { 1, 10 }, ['end'] = { 7, 10 } }, --
      ecmascript = { start = { 10, 1 }, ['end'] = { 10, 10 } }, --
      elixir = { start = { 6, 5 }, ['end'] = { 1, 5 } }, --
      java = { start = { 1, 1 }, ['end'] = { 4, 4 } }, --
      lisp = { start = { 3, 6 }, ['end'] = { 6, 3 } }, --
      lua = { start = { 8, 9 }, ['end'] = { 6, 7 } }, --
      ruby = { start = { 8, 6 }, ['end'] = { 5, 9 } }, --
      rust = { start = { 9, 5 }, ['end'] = { 9, 2 } }
    }
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should fail to locate words that are not on horizontal, vertical, or diagonal lines', function()
    local grid = { --
      'abc', --
      'def'
    }
    local words = { --
      'aef', --
      'ced', --
      'abf', --
      'cbd'
    }
    local expected = {}
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should not concatenate different lines to find a horizontal word', function()
    local grid = { --
      'abceli', --
      'xirdfg'
    }
    local words = { --
      'elixir'
    }
    local expected = {}
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should not wrap around horizontally to find a word', function()
    local grid = { --
      'silabcdefp'
    }
    local words = { --
      'lisp'
    }
    local expected = {}
    assert.are.same(expected, WordSearch(grid).search(words))
  end)

  it('should not wrap around vertically to find a word', function()
    local grid = { --
      's', --
      'u', --
      'r', --
      'a', --
      'b', --
      'c', --
      't'
    }
    local words = { --
      'rust'
    }
    local expected = {}
    assert.are.same(expected, WordSearch(grid).search(words))
  end)
end)
