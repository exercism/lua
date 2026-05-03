local utils = require 'utils'

local function render_expected(expected)
  local key_value_pairs = {}
  for k, v in pairs(expected) do
    local template = "%s = { start = { %d, %d }, ['end'] = { %d, %d } }"
    local key_value_pair = template:format(k, v.start.column, v.start.row, v['end'].column, v['end'].row)
    table.insert(key_value_pairs, key_value_pair)
  end
  table.sort(key_value_pairs)

  if #key_value_pairs == 0 then
    return '{}'
  else
    return '{ --\n' .. table.concat(key_value_pairs, ', --\n') .. '\n}'
  end
end

return {
  module_name = 'WordSearch',

  generate_test = function(case)
    local template = [[
      local grid = { --
        %s
      }
      local words = { --
        %s
      }
      local expected = %s
      assert.are.same(expected, WordSearch(grid).search(words))]]

    local grid = table.concat(utils.map(case.input.grid, utils.stringify), ', --\n')
    local words = table.concat(utils.map(case.input.wordsToSearchFor, utils.stringify), ', --\n')
    local expected = render_expected(case.expected)

    return template:format(grid, words, expected)
  end
}
