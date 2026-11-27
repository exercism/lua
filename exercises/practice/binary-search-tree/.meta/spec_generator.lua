local utils = require 'utils'

local function render_values(values)
  return '{ ' .. table.concat(utils.map(values, tonumber), ', ') .. ' }'
end

local function render_node_assertions(node, path, lines)
  table.insert(lines, ('assert.equal(%d, %s.value)'):format(tonumber(node.data), path))

  for _, side in ipairs({ 'left', 'right' }) do
    local child_path = path .. '.' .. side
    if node[side] then
      render_node_assertions(node[side], child_path, lines)
    else
      table.insert(lines, ('assert.is_nil(%s)'):format(child_path))
    end
  end

  return lines
end

return {
  module_name = 'BinarySearchTree',

  test_helpers = [[
    local function sorted_values(tree)
      local values = {}
      for value in tree:values() do
        table.insert(values, value)
      end
      return values
    end
  ]],

  generate_test = function(case)
    local tree = ('local tree = BinarySearchTree:from_list(%s)'):format(render_values(case.input.treeData))

    if case.property == 'sortedData' then
      local template = [[
        %s
        assert.same(%s, sorted_values(tree))]]
      return template:format(tree, render_values(case.expected))
    end

    return table.concat(render_node_assertions(case.expected, 'tree', { tree }), '\n')
  end
}
