local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_board(board)
  return table.concat(map(board, function(row)
    return '\'' .. row .. '\', --'
  end), '\n')
end

return {
  module_name = 'state_of_tic_tac_toe',

  generate_test = function(case)
    if type(case.expected) == 'string' then
      local template = [[
        local board = {
          %s
        }
        assert.are.same('%s', state_of_tic_tac_toe.gamestate(board))]]
      return template:format(render_board(case.input.board), case.expected)
    else
      local template = [[
        local board = {
          %s
        }
        assert.has.error(function()
          state_of_tic_tac_toe.gamestate(board)
        end)]]
      return template:format(render_board(case.input.board))
    end
  end
}
