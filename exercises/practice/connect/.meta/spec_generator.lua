local utils = require 'utils'

local function render_board(board)
  return table.concat(utils.map(board, function(row)
    return "'" .. row .. "', --"
  end), '\n      ')
end

return {
  module_name = 'connect',

  generate_test = function(case)
    local template = [[
      local board = {
        %s
      }
      assert.are.same('%s', connect.winner(board))]]

    return template:format(render_board(case.input.board), case.expected)
  end
}
