local binary_operator = {
  sub = '-',
  add = '+',
  mul = '*',
  div = '/'
}

local function value(input)
  if type(input) ~= 'table' then
    input = { input }
  end
  return 'Complex(' .. table.concat(input, ', ') .. ')'
end

return {
  module_name = 'Complex',

  test_helpers = [[
    local pi = math.pi
    local e = math.exp(1)
    local ln = math.log
  ]],

  generate_test = function(case)
    if case.input.z then
      local template = [[
        assert.equal(%s, %s.%s())]]

      return template:format(
        value(case.expected),
        value(case.input.z),
        case.property
      )
    else
      local template = [[
        assert.equal(%s, %s %s %s)]]

      return template:format(
        value(case.expected),
        value(case.input.z1),
        binary_operator[case.property],
        value(case.input.z2)
      )
    end
  end
}
