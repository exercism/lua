local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_dominoes(dominoes)
  return table.concat(map(dominoes, function(domino)
    return ('{ %s }'):format(table.concat(domino, ', '))
  end), ', ')
end

return {
  module_name = 'dominoes',

  generate_test = function(case)
    local template = [[
      local input = {
        %s
      }
      assert.is_%s(dominoes.can_chain(input))]]
    return template:format(render_dominoes(case.input.dominoes), case.expected)
  end
}
