local utils = require 'utils'

local function stringify(s)
  return "'" .. s .. "'"
end

return {
  module_name = 'rcd',

  generate_test = function(case)
    local template = [[
        assert.equal(%d, rcd.value({ %s }))]]
    return template:format(case.expected, table.concat(utils.map(case.input.colors, stringify), ', '))
  end
}
