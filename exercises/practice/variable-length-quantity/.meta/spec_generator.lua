local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_integers(integers)
  return table.concat(map(integers, function(integer)
    return string.format("0x%x", integer)
  end), ', ')
end

return {
  module_name = 'vlq',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          vlq.%s({ %s })
        end)]]
      return template:format(case.property, render_integers(case.input.integers))
    else
      local template = [[
        assert.are.same({ %s }, vlq.%s({ %s }))]]
      return template:format(render_integers(case.expected), case.property, render_integers(case.input.integers))
    end
  end
}
