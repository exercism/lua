local utils = require 'utils'

local function render_matrix(matrix)
  return table.concat(utils.map(matrix, function(row)
    return '{' .. table.concat(row, ', ') .. '}, --'
  end), '\n')
end

return {
  module_name = 'game_of_life',

  generate_test = function(case)
    local template = [[
      local matrix = {
        %s
      }
      local expected = {
        %s
      }
      assert.are.same(expected, game_of_life.tick(matrix))]]
    return template:format(render_matrix(case.input.matrix), render_matrix(case.expected))
  end
}
