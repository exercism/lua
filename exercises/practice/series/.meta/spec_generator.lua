local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_substrings(substrings)
  return table.concat(map(substrings, function(substring)
    return string.format('"%s"', substring)
  end), ', ')
end

return {
  module_name = 'series',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          series("%s", %s)
        end, "%s")]]
      return template:format(case.input.series, case.input.sliceLength, case.expected.error)
    else
      local template = [[
        local result = {}
        for s in series("%s", %s) do
          table.insert(result, s)
        end
        assert.same({ %s }, result)]]
      return template:format(case.input.series, case.input.sliceLength, render_substrings(case.expected))
    end
  end
}
