local function snake_case(str)
  local s = str:gsub('%u', function(c)
    return '_' .. c:lower()
  end)
  if s:sub(1, 1) == '_' then
    s = s:sub(2)
  end
  return s
end

return {
  module_name = 'EliudsEggs',

  generate_test = function(case)
    local template = [[
      assert.equal(%s, EliudsEggs.%s(%s))]]
    return template:format(case.expected, snake_case(case.property), case.input.number)
  end
}
