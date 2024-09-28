local killer_sudoku_helper = require('killer-sudoku-helper')

describe('killer-sudoku-helper', function()
  describe('trivial 1-digit cages', function()
    it('1', function()
      local expected = {
        { 1 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(1, 1))
    end)

    it('2', function()
      local expected = {
        { 2 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(2, 1))
    end)

    it('3', function()
      local expected = {
        { 3 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(3, 1))
    end)

    it('4', function()
      local expected = {
        { 4 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(4, 1))
    end)

    it('5', function()
      local expected = {
        { 5 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(5, 1))
    end)

    it('6', function()
      local expected = {
        { 6 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(6, 1))
    end)

    it('7', function()
      local expected = {
        { 7 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(7, 1))
    end)

    it('8', function()
      local expected = {
        { 8 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(8, 1))
    end)

    it('9', function()
      local expected = {
        { 9 } --
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(9, 1))
    end)
  end)

  it('cage with sum 45 contains all digits 1:9', function()
    local expected = {
      { 1, 2, 3, 4, 5, 6, 7, 8, 9 } --
    }
    assert.are.same(expected, killer_sudoku_helper.combinations(45, 9))
  end)

  it('cage with only 1 possible combination', function()
    local expected = {
      { 1, 2, 4 } --
    }
    assert.are.same(expected, killer_sudoku_helper.combinations(7, 3))
  end)

  it('cage with several combinations', function()
    local expected = {
      { 1, 9 }, --
      { 2, 8 }, --
      { 3, 7 }, --
      { 4, 6 } --
    }
    assert.are.same(expected, killer_sudoku_helper.combinations(10, 2))
  end)

  it('cage with several combinations that is restricted', function()
    local expected = {
      { 2, 8 }, --
      { 3, 7 } --
    }
    assert.are.same(expected, killer_sudoku_helper.combinations(10, 2, { 1, 4 }))
  end)
end)
