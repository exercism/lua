local function stringify(s)
  s = s:gsub('\n', '\\n')
  if s:match("'") and not s:match('"') then
    return '"' .. s .. '"'
  else
    return "'" .. s:gsub("'", "\\'") .. "'"
  end
end

local function format_hash(t)
  local key_value_pairs = {}
  for key in pairs(t) do
    table.insert(key_value_pairs, "[" .. stringify(key) .. "] = " .. t[key])
  end

  table.sort(key_value_pairs)

  return '{ ' .. table.concat(key_value_pairs, ', ') .. ' }'
end

return {
  module_name = 'word_count',

  generate_test = function(case)
    local template = [[
      local result = word_count.count_words(%s)
      local expected = %s
      assert.are.same(expected, result)]]

    return template:format(stringify(case.input.sentence), format_hash(case.expected))
  end
}
