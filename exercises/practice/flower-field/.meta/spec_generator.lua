local utils = require 'utils'

local function render_garden(garden)
  return table.concat(utils.map(garden, function(row)
    return "'" .. row .. "', --"
  end), '\n      ')
end

return {
  module_name = 'flower_field',

  generate_test = function(case)
    local template = [[
      local garden = {
        %s
      }
      local expected = {
        %s
      }
      assert.same(expected, flower_field.annotate(garden))]]

    return template:format(render_garden(case.input.garden), render_garden(case.expected))
  end
}
