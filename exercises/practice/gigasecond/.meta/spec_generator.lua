local function components(moment)
  return moment:match("(%d%d%d%d)%-(%d%d)%-(%d%d)T?(%d*):?(%d*):?(%d*)")
end

local function to_num(str)
  if str ~= nil and str ~= '' then
    return tonumber(str)
  end
  return 0
end

return {
  module_name = 'gigasecond',

  generate_test = function(case)
    local year, month, day, hour, min, sec = components(case.input.moment)
    year, month, day = to_num(year), to_num(month), to_num(day)
    hour, min, sec = to_num(hour), to_num(min), to_num(sec)

    local e_year, e_month, e_day, e_hour, e_min, e_sec = components(case.expected)
    e_year, e_month, e_day = to_num(e_year), to_num(e_month), to_num(e_day)
    e_hour, e_min, e_sec = to_num(e_hour), to_num(e_min), to_num(e_sec)

    local template = [[
      local momentA = os.time({ year = %d, month = %d, day = %d, hour = %d, min = %d, sec = %d })
      local momentB = os.time({ year = %d, month = %d, day = %d, hour = %d, min = %d, sec = %d })
      local result = gigasecond.anniversary(momentA)
      local expected = os.date('!%%x', momentB)
      assert.are.equals(expected, result)]]

    return template:format(
      year, month, day, hour, min, sec,
      e_year, e_month, e_day, e_hour, e_min, e_sec
    )
  end
}
