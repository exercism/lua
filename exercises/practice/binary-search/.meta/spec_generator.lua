return {
  module_name = 'find',

  test_helpers = [[
    local TracedArray = require('TracedArray')
    require('assertions')
  ]],

  generate_test = function(case)
    local array = case.input.array
    local expected = type(case.expected) == 'table' and -1 or case.expected + 1

    local lines = {
      ('local array = TracedArray { %s }'):format(table.concat(array, ', ')),
      ('assert.equal(%d, find(array, %d))'):format(expected, case.input.value)
    }

    if #array > 0 then
      local max_accesses = math.floor(math.log(#array, 2)) + 1
      table.insert(lines, ('assert.lteq(array.access_count, %d)'):format(max_accesses))
    end

    return table.concat(lines, '\n')
  end
}
