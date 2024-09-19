local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_matrix(matrix)
  return table.concat(map(matrix, function(row)
    return '{' .. table.concat(row, ', ') .. '}, --'
  end), '\n')
end

local function render_result(result)
  return table.concat(map(result, function(point)
    return ('{ row = %s, column = %s }, --'):format(point.row, point.column)
  end), '\n')
end

return {
  module_name = 'saddle_points',

  test_helpers = [[
    local function saddle_points_are_equal(expected, actual)
      if #expected ~= #actual then
        return false
      end
      for i = 1, #expected do
        for j = 1, #actual do
          if expected[i].row == actual[j].row and expected[i].column == actual[j].column then
            break
          end
          if j == #actual then
            return false
          end
        end
      end
      return true
    end
  ]],

  generate_test = function(case)
    local template = [[
      local matrix = {
        %s
      }
      local expected = {
        %s
      }
      assert(saddle_points_are_equal(expected, saddle_points(matrix)))]]
    return template:format(render_matrix(case.input.matrix), render_result(case.expected))
  end
}
