local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_song(lines)
  return table.concat(map(lines, function(line)
    return '\'' .. line .. '\''
  end), ',\n')
end

return {
  module_name = 'twelve_days',

  generate_test = function(case)
    local template = [[
      local expected = {
        %s
      }
      assert.are.same(expected, twelve_days.recite(%d, %d))]]
    return template:format(render_song(case.expected), case.input.startVerse, case.input.endVerse)
  end
}
