local function components(moment)
  return moment:match("(%d%d%d%d)%-(%d%d)%-(%d%d)T?(%d*):?(%d*):?(%d*)")
end

local function map_to_num(...)
  local t = { ... }
  for i, str in ipairs(t) do
    if str ~= nil and str ~= '' then
      t[i] = tonumber(str)
    else
      t[i] = 0
    end
  end
  return table.unpack(t)
end

return {
  module_name = 'gigasecond',

  generate_test = function(case)
    local year, month, day, hour, min, sec = map_to_num(components(case.input.moment))
    local e_year, e_month, e_day, e_hour, e_min, e_sec = map_to_num(components(case.expected))

    local template = [[
      local momentA = os.time({ year = %d, month = %d, day = %d, hour = %d, min = %d, sec = %d })
      local momentB = os.time({ year = %d, month = %d, day = %d, hour = %d, min = %d, sec = %d })
      local actual = gigasecond.anniversary(momentA)
      local expected = os.date('!%%x', momentB)
      assert.are.equals(expected, actual)]]

    return template:format(year, month, day, hour, min, sec, e_year, e_month, e_day, e_hour, e_min, e_sec)
  end
}
