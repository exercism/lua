local utils = require 'utils'

local function render_triplets(triplets)
  return '{ ' .. table.concat(utils.map(triplets, function(triplet)
    return '{ ' .. table.concat(triplet, ', ') .. ' }'
  end), ', ') .. ' }'
end

return {
  module_name = 'triplets_with_sum',

  test_helpers = [[
    local function sort(triplets)
      table.sort(triplets, function(a, b)
        return a[1] < b[1]
      end)
      return triplets
    end
  ]],

  generate_test = function(case)
    local template = [[
      assert.same(%s, sort(triplets_with_sum(%d)))]]
    return template:format(render_triplets(case.expected), case.input.n)
  end
}
