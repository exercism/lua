local state_of_tic_tac_toe = require('state-of-tic-tac-toe')

describe('state-of-tic-tac-toe', function()
  describe('won games', function()
    it('finished game where x won via left column victory', function()
      local board = {
        'XOO', --
        'X  ', --
        'X  ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via middle column victory', function()
      local board = {
        'OXO', --
        ' X ', --
        ' X ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via right column victory', function()
      local board = {
        'OOX', --
        '  X', --
        '  X' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via left column victory', function()
      local board = {
        'OXX', --
        'OX ', --
        'O  ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via middle column victory', function()
      local board = {
        'XOX', --
        ' OX', --
        ' O ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via right column victory', function()
      local board = {
        'XXO', --
        ' XO', --
        '  O' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via top row victory', function()
      local board = {
        'XXX', --
        'XOO', --
        'O  ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via middle row victory', function()
      local board = {
        'O O', --
        'XXX', --
        ' O ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via middle row victory', function()
      local board = {
        'O  ', --
        'XXX', --
        ' O ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via bottom row victory', function()
      local board = {
        ' OO', --
        'O X', --
        'XXX' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via top row victory', function()
      local board = {
        'OOO', --
        'XXO', --
        'XX ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via middle row victory', function()
      local board = {
        'XX ', --
        'OOO', --
        'X  ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via bottom row victory', function()
      local board = {
        'XOX', --
        ' XX', --
        'OOO' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via falling diagonal victory', function()
      local board = {
        'XOO', --
        ' X ', --
        '  X' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via rising diagonal victory', function()
      local board = {
        'O X', --
        'OX ', --
        'X  ' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via falling diagonal victory', function()
      local board = {
        'OXX', --
        'OOX', --
        'X O' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where o won via rising diagonal victory', function()
      local board = {
        '  O', --
        ' OX', --
        'OXX' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via a row and a column victory', function()
      local board = {
        'XXX', --
        'XOO', --
        'XOO' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)

    it('finished game where x won via two diagonal victories', function()
      local board = {
        'XOX', --
        'OXO', --
        'XOX' --
      }
      assert.are.same('win', state_of_tic_tac_toe.gamestate(board))
    end)
  end)

  describe('drawn games', function()
    it('draw', function()
      local board = {
        'XOX', --
        'XXO', --
        'OXO' --
      }
      assert.are.same('draw', state_of_tic_tac_toe.gamestate(board))
    end)

    it('another draw', function()
      local board = {
        'XXO', --
        'OXX', --
        'XOO' --
      }
      assert.are.same('draw', state_of_tic_tac_toe.gamestate(board))
    end)
  end)

  describe('ongoing games', function()
    it('ongoing game: one move in', function()
      local board = {
        '   ', --
        'X  ', --
        '   ' --
      }
      assert.are.same('ongoing', state_of_tic_tac_toe.gamestate(board))
    end)

    it('ongoing game: two moves in', function()
      local board = {
        'O  ', --
        ' X ', --
        '   ' --
      }
      assert.are.same('ongoing', state_of_tic_tac_toe.gamestate(board))
    end)

    it('ongoing game: five moves in', function()
      local board = {
        'X  ', --
        ' XO', --
        'OX ' --
      }
      assert.are.same('ongoing', state_of_tic_tac_toe.gamestate(board))
    end)
  end)

  describe('invalid boards', function()
    it('invalid board: x went twice', function()
      local board = {
        'XX ', --
        '   ', --
        '   ' --
      }
      assert.has.error(function()
        state_of_tic_tac_toe.gamestate(board)
      end)
    end)

    it('invalid board: o started', function()
      local board = {
        'OOX', --
        '   ', --
        '   ' --
      }
      assert.has.error(function()
        state_of_tic_tac_toe.gamestate(board)
      end)
    end)

    it('invalid board: x won and o kept playing', function()
      local board = {
        'XXX', --
        'OOO', --
        '   ' --
      }
      assert.has.error(function()
        state_of_tic_tac_toe.gamestate(board)
      end)
    end)

    it('invalid board: players kept playing after a win', function()
      local board = {
        'XXX', --
        'OOO', --
        'XOX' --
      }
      assert.has.error(function()
        state_of_tic_tac_toe.gamestate(board)
      end)
    end)
  end)
end)
