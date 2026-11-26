local function rational(r)
  return ('{ %d, %d }'):format(r[1], r[2])
end

local binary_operations = { add = 'add', sub = 'subtract', mul = 'multiply', div = 'divide' }

return {
  module_name = 'rational_numbers',

  generate_test = function(case)
    local input = case.input

    if binary_operations[case.property] then
      local template = 'assert.are.same(%s, rational_numbers.%s(%s, %s))'
      return template:format(rational(case.expected), binary_operations[case.property], rational(input.r1),
                             rational(input.r2))
    end

    if case.property == 'exprational' then
      local template = 'assert.are.same(%s, rational_numbers.exp_rational(%s, %d))'
      return template:format(rational(case.expected), rational(input.r), input.n)
    end

    if case.property == 'expreal' then
      local template = 'assert.are.near(%s, rational_numbers.exp_real(%s, %s), 0.00001)'
      return template:format(case.expected, input.x, rational(input.r))
    end

    local template = 'assert.are.same(%s, rational_numbers.%s(%s))'
    return template:format(rational(case.expected), case.property, rational(input.r))
  end
}
