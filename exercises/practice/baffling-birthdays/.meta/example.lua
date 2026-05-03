local baffling_birthdays = {}

baffling_birthdays.shared_birthday = function(birthdates)
  local seen = {}
  for _, birthdate in ipairs(birthdates) do
    local without_year = birthdate:sub(6)
    if seen[without_year] then
      return true
    end
    seen[without_year] = true
  end
  return false
end

baffling_birthdays.random_birthdates = function(count)
  local birthdates = {}

  local non_leap_year = 2026
  local seconds_per_day = 24 * 60 * 60
  local start = os.time({ year = non_leap_year, month = 1, day = 1, hour = 12 })
  for i = 1, count do
    local offset = math.random(0, 364)
    local t = start + offset * seconds_per_day
    table.insert(birthdates, os.date('%Y-%m-%d', t))
  end

  return birthdates
end

baffling_birthdays.estimated_probability_of_shared_birthday = function(group_size)
  local shared_count = 0
  for i = 1, 10000 do
    local birthdates = baffling_birthdays.random_birthdates(group_size)
    if baffling_birthdays.shared_birthday(birthdates) then
      shared_count = shared_count + 1
    end
  end
  return shared_count / 100
end

return baffling_birthdays
