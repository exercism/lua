local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

-- local function render_matrix(matrix)
--   return table.concat(map(matrix, function(row)
--     return '{' .. table.concat(row, ', ') .. '}, --'
--   end), '\n')
-- end

local function render_dominoes(dominoes)
  return table.concat(map(dominoes, function(domino)
    return ('{ %s }'):format(table.concat(domino, ', '))
  end), ', ')
end

return {
  module_name = 'dominoes',

  -- test_helpers = [[
  --   local function saddle_points_are_equal(expected, actual)
  --     if #expected ~= #actual then
  --       return false
  --     end
  --     for i = 1, #expected do
  --       for j = 1, #actual do
  --         if expected[i].row == actual[j].row and expected[i].column == actual[j].column then
  --           break
  --         end
  --         if j == #actual then
  --           return false
  --         end
  --       end
  --     end
  --     return true
  --   end
  -- ]],

  generate_test = function(case)
    local template = [[
      local input = {
        %s
      }
      assert.is_%s(dominoes.can_chain(input))]]
    return template:format(render_dominoes(case.input.dominoes), case.expected)
  end
}
