local function map(t, f)
  local result = {}
  for i, v in ipairs(t) do
    result[i] = f(v)
  end
  return result
end

local function render_list(list)
  if type(list) ~= 'table' then
    return list
  end

  return '{' .. table.concat(map(list, render_list), ', ') .. '}'
end

local function render_function(s)
  s = s:gsub('modulo', '%%')
  local args, body = s:match('^(.+)%s*->%s*(.+)$')
  return 'function' .. args .. ' return ' .. body .. ' end'
end

return {
  module_name = 'list_ops',

  generate_test = function(case)
    if case.input.lists then
      local template = [[
        local expected = %s
        local actual = list_ops.%s(%s)
        assert.are.same(expected, actual)]]

      return template:format(render_list(case.expected), case.property,
                             render_list(table.concat(map(case.input.lists, render_list), ', ')))
    elseif case.input.list1 and case.input.list2 then
      local template = [[
        local expected = %s
        local actual = list_ops.%s(%s, %s)
        assert.are.same(expected, actual)]]

      return template:format(render_list(case.expected), case.property, render_list(case.input.list1),
                             render_list(case.input.list2))
    elseif case.input.list and case.input['function'] and case.input.initial then
      local template = [[
        local expected = %s
        local actual = list_ops.%s(%s, %s, %s)
        assert.are.same(expected, actual)]]

      return template:format(render_list(case.expected), case.property, render_list(case.input.list),
                             render_list(case.input.initial), render_function(case.input['function']))
    elseif case.input.list and case.input['function'] then
      local template = [[
        local expected = %s
        local actual = list_ops.%s(%s, %s)
        assert.are.same(expected, actual)]]

      return template:format(render_list(case.expected), case.property, render_list(case.input.list),
                             render_function(case.input['function']))
    elseif case.input.list then
      local template = [[
        local expected = %s
        local actual = list_ops.%s(%s)
        assert.are.same(expected, actual)]]

      return template:format(render_list(case.expected), case.property, render_list(case.input.list))
    else
      error('Unhandled case')
    end
  end
}
