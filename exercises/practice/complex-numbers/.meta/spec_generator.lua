local unary_operator = { real = 'r', imaginary = 'i', abs = 'abs()', conjugate = 'conj()', exp = 'exp()' }

local binary_operator = { sub = '-', add = '+', mul = '*', div = '/' }

local function complex(input)
  if type(input) ~= 'table' then
    input = { input }
  end
  return 'Complex(' .. table.concat(input, ', ') .. ')'
end

local function scalar(input)
  return tostring(input)
end

local unary_result_type = { real = scalar, imaginary = scalar, abs = scalar, conjugate = complex, exp = complex }

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
        assert.equal(%s, %s.%s)]]

      return template:format(unary_result_type[case.property](case.expected), complex(case.input.z),
                             unary_operator[case.property])
    else
      local template = [[
        assert.equal(%s, %s %s %s)]]

      return template:format(complex(case.expected), complex(case.input.z1), binary_operator[case.property],
                             complex(case.input.z2))
    end
  end
}
