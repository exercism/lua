local utils = require 'utils'

local function render_strings(strings)
  return table.concat(utils.map(strings, function(row)
    return "'" .. row .. "', --"
  end), '\n      ')
end

return {
  module_name = 'rectangles',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, rectangles.count({
        %s
      }))]]

    return template:format(case.expected, render_strings(case.input.strings))
  end
}
