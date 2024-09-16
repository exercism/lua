local game_of_life = require('game-of-life')

describe('game-of-life', function()
  it('empty matrix', function()
    local matrix = {}
    local expected = {}
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('live cells with zero live neighbors die', function()
    local matrix = {
      { 0, 0, 0 }, --
      { 0, 1, 0 }, --
      { 0, 0, 0 } --
    }
    local expected = {
      { 0, 0, 0 }, --
      { 0, 0, 0 }, --
      { 0, 0, 0 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('live cells with only one live neighbor die', function()
    local matrix = {
      { 0, 0, 0 }, --
      { 0, 1, 0 }, --
      { 0, 1, 0 } --
    }
    local expected = {
      { 0, 0, 0 }, --
      { 0, 0, 0 }, --
      { 0, 0, 0 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('live cells with two live neighbors stay alive', function()
    local matrix = {
      { 1, 0, 1 }, --
      { 1, 0, 1 }, --
      { 1, 0, 1 } --
    }
    local expected = {
      { 0, 0, 0 }, --
      { 1, 0, 1 }, --
      { 0, 0, 0 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('live cells with three live neighbors stay alive', function()
    local matrix = {
      { 0, 1, 0 }, --
      { 1, 0, 0 }, --
      { 1, 1, 0 } --
    }
    local expected = {
      { 0, 0, 0 }, --
      { 1, 0, 0 }, --
      { 1, 1, 0 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('dead cells with three live neighbors become alive', function()
    local matrix = {
      { 1, 1, 0 }, --
      { 0, 0, 0 }, --
      { 1, 0, 0 } --
    }
    local expected = {
      { 0, 0, 0 }, --
      { 1, 1, 0 }, --
      { 0, 0, 0 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('live cells with four or more neighbors die', function()
    local matrix = {
      { 1, 1, 1 }, --
      { 1, 1, 1 }, --
      { 1, 1, 1 } --
    }
    local expected = {
      { 1, 0, 1 }, --
      { 0, 0, 0 }, --
      { 1, 0, 1 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)

  it('bigger matrix', function()
    local matrix = {
      { 1, 1, 0, 1, 1, 0, 0, 0 }, --
      { 1, 0, 1, 1, 0, 0, 0, 0 }, --
      { 1, 1, 1, 0, 0, 1, 1, 1 }, --
      { 0, 0, 0, 0, 0, 1, 1, 0 }, --
      { 1, 0, 0, 0, 1, 1, 0, 0 }, --
      { 1, 1, 0, 0, 0, 1, 1, 1 }, --
      { 0, 0, 1, 0, 1, 0, 0, 1 }, --
      { 1, 0, 0, 0, 0, 0, 1, 1 } --
    }
    local expected = {
      { 1, 1, 0, 1, 1, 0, 0, 0 }, --
      { 0, 0, 0, 0, 0, 1, 1, 0 }, --
      { 1, 0, 1, 1, 1, 1, 0, 1 }, --
      { 1, 0, 0, 0, 0, 0, 0, 1 }, --
      { 1, 1, 0, 0, 1, 0, 0, 1 }, --
      { 1, 1, 0, 1, 0, 0, 0, 1 }, --
      { 1, 0, 0, 0, 0, 0, 0, 0 }, --
      { 0, 0, 0, 0, 0, 0, 1, 1 } --
    }
    assert.are.same(expected, game_of_life.tick(matrix))
  end)
end)
