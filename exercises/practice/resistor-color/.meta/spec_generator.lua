local utils = require 'utils'

local function render_table(t)
  return table.concat(utils.map(t, function(element)
    return "'" .. element .. "'"
  end), ', --\n')
end

return {
  module_name = 'rc',

  generate_test = function(case)
    if case.property == 'colors' then
      local template = [[
        assert.same({ %s }, rc.colors())]]
      return template:format(render_table(case.expected))
    else
      local template = [[
        assert.equal(%d, rc.color_code('%s'))]]
      return template:format(case.expected, case.input.color)
    end
  end
}
