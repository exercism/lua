local utils = require 'utils'

local function render_counts(counts)
  local keys = {}
  for k in pairs(counts) do
    table.insert(keys, k)
  end
  table.sort(keys)

  local entries = utils.map(keys, function(k)
    return k .. ' = ' .. counts[k]
  end)

  return '{ ' .. table.concat(entries, ', ') .. ' }'
end

return {
  module_name = 'DNA',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          DNA:new(%s)
        end)]]
      return template:format(utils.stringify(case.input.strand))
    else
      local template = [[
        local dna = DNA:new(%s)
        local expected = %s
        assert.are.same(expected, dna.nucleotideCounts)]]
      return template:format(utils.stringify(case.input.strand), render_counts(case.expected))
    end
  end
}
