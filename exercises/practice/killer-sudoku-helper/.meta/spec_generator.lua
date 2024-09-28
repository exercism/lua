local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_solutions(solutions)
  return table.concat(map(solutions, function(solution)
    return '{' .. table.concat(solution, ', ') .. '}, --'
  end), '\n')
end

local function render_optional_exclude(exclude)
  if #exclude == 0 then
    return ''
  end

  return ', {' .. table.concat(exclude, ', ') .. '}'
end

return {
  module_name = 'killer_sudoku_helper',

  generate_test = function(case)
    local template = [[
      local expected = {
        %s
      }
      assert.are.same(expected, killer_sudoku_helper.combinations(%d, %d%s))]]
    return template:format(render_solutions(case.expected), case.input.cage.sum, case.input.cage.size,
                           render_optional_exclude(case.input.cage.exclude))
  end
}
