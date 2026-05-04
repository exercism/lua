local utils = require 'utils'

return {
  module_name = 'sum_of_multiples',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, sum_of_multiples(%s).to(%s))]]

    local factors = '{ ' .. table.concat(utils.map(case.input.factors, tostring), ', ') .. ' }'
    return template:format(tostring(case.expected), factors, case.input.limit)
  end
}
