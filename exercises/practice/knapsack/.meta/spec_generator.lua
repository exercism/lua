local utils = require 'utils'

local function render_items(items)
  return table.concat(utils.map(items, function(item)
    return ('{ weight = %d, value = %d }'):format(item.weight, item.value)
  end), ', ')
end

return {
  module_name = 'knapsack',

  generate_test = function(case)
    local template = [[
      local items = { %s }
      local maximum_weight = %d

      assert.are.equal(%d, knapsack.maximum_value(maximum_weight, items))]]
    return template:format(render_items(case.input.items), case.input.maximumWeight, case.expected)
  end
}
