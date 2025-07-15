local function map(t, f)
  local mapped = {}
  for i, v in ipairs(t) do
    mapped[i] = f(v)
  end
  return mapped
end

local function render_list(list)
  return '{ ' .. table.concat(map(list, function(v)
    return "'" .. v .. "'"
  end), ', ') .. ' }'
end

return {
  module_name = 'Anagram',

  test_helpers = [[
    local function sorted_clone(t)
      local clone = {}
      for k, v in pairs(t) do
        clone[k] = v
      end
      table.sort(clone)
      return clone
    end

    local function assert_lists_are_same(expected, actual)
      assert.are.same(sorted_clone(expected), sorted_clone(actual))
    end
  ]],

  generate_test = function(case)
    local template = [[
      local detector = Anagram:new('%s')
      local result = detector:match(%s)
      local expected = %s
      assert_lists_are_same(expected, result)]]

    return template:format(case.input.subject, render_list(case.input.candidates), render_list(case.expected))
  end
}
