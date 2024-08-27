local connect = require('connect')

-- LuaFormatter off
describe('connect', function()
  it('an empty board has no winner', function()
    local board = {
      '. . . . .',
      ' . . . . .',
      '  . . . . .',
      '   . . . . .',
      '    . . . . .'
    }
    assert.are.same('', connect.winner(board))
  end)

  it('X can win on a 1x1 board', function()
    local board = {
      'X'
    }
    assert.are.same('X', connect.winner(board))
  end)

  it('O can win on a 1x1 board', function()
    local board = {
      'O'
    }
    assert.are.same('O', connect.winner(board))
  end)

  it('only edges does not make a winner', function()
    local board = {
      'O O O X',
      ' X . . X',
      '  X . . X',
      '   X O O O'
    }
    assert.are.same('', connect.winner(board))
  end)

  it('illegal diagonal does not make a winner', function()
    local board = {
      'X O . .',
      ' O X X X',
      '  O X O .',
      '   . O X .',
      '    X X O O'
    }
    assert.are.same('', connect.winner(board))
  end)

  it('nobody wins crossing adjacent angles', function()
    local board = {
      'X . . .',
      ' . X O .',
      '  O . X O',
      '   . O . X',
      '    . . O .'
    }
    assert.are.same('', connect.winner(board))
  end)

  it('X wins crossing from left to right', function()
    local board = {
      '. O . .',
      ' O X X X',
      '  O X O .',
      '   X X O X',
      '    . O X .'
    }
    assert.are.same('X', connect.winner(board))
  end)

  it('O wins crossing from top to bottom', function()
    local board = {
      '. O . .',
      ' O X X X',
      '  O O O .',
      '   X X O X',
      '    . O X .'
    }
    assert.are.same('O', connect.winner(board))
  end)

  it('X wins using a convoluted path', function()
    local board = {
      '. X X . .',
      ' X . X . X',
      '  . X . X .',
      '   . X X . .',
      '    O O O O O'
    }
    assert.are.same('X', connect.winner(board))
  end)

  it('X wins using a spiral path', function()
    local board = {
      'O X X X X X X X X',
      ' O X O O O O O O O',
      '  O X O X X X X X O',
      '   O X O X O O O X O',
      '    O X O X X X O X O',
      '     O X O O O X O X O',
      '      O X X X X X O X O',
      '       O O O O O O O X O',
      '        X X X X X X X X O'
    }
    assert.are.same('X', connect.winner(board))
  end)
end)
-- LuaFormatter on
