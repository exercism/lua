local map = function(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function stringify(v)
  return ("'%s'"):format(tostring(v))
end

return {
  module_name = 'protein_translation',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          protein_translation.%s('%s')
        end)]]

      return template:format(case.property, case.input.strand)
    else
      local template = [[
        assert.are.same({ %s }, protein_translation.%s('%s'))]]

      return template:format(table.concat(map(case.expected, stringify), ', '), case.property, case.input.strand)
    end
  end
}
