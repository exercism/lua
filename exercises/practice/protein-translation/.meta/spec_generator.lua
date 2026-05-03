local utils = require 'utils'

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

      return template:format(table.concat(utils.map(case.expected, stringify), ', '), case.property, case.input.strand)
    end
  end
}
