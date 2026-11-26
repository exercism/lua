local function set(elements)
  return ('Set(%s)'):format(table.concat(elements, ', '))
end

local predicates = { subset = 'is_subset', disjoint = 'is_disjoint', equal = 'equals' }

return {
  module_name = 'Set',

  generate_test = function(case)
    local input = case.input

    if case.property == 'empty' then
      return ('assert.is_%s(%s:is_empty())'):format(case.expected, set(input.set))
    end

    if case.property == 'contains' then
      return ('assert.is_%s(%s:contains(%d))'):format(case.expected, set(input.set), input.element)
    end

    if predicates[case.property] then
      local template = 'assert.is_%s(%s:%s(%s))'
      return template:format(case.expected, set(input.set1), predicates[case.property], set(input.set2))
    end

    if case.property == 'add' then
      local template = [[
        local s = %s
        s:add(%d)
        assert.is_true(s:equals(%s))]]
      return template:format(set(input.set), input.element, set(case.expected))
    end

    local template = 'assert.is_true(%s:%s(%s):equals(%s))'
    return template:format(set(input.set1), case.property, set(input.set2), set(case.expected))
  end
}
