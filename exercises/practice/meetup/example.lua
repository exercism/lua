local day_name_to_number = {
  Sunday = 1,
  Monday = 2,
  Tuesday = 3,
  Wednesday = 4,
  Thursday = 5,
  Friday = 6,
  Saturday = 7
}

local function matching_days(config)
  local meetup_day = day_name_to_number[config.day]
  local days = {}

  for day = 1, math.huge do
    local date = os.date('*t', os.time({
      year = config.year,
      month = config.month,
      day = day
    }))

    if date.month ~= config.month then break end

    if date.wday == meetup_day then
      table.insert(days, day)
    end
  end

  return days
end

local function first_teenth(t)
  for _, v in ipairs(t) do
    if v > 12 then return v end
  end
end

local function last(t)
  return t[#t]
end

local function ordinal(t, which)
  return t[({
    first = 1,
    second = 2,
    third = 3,
    fourth = 4
  })[which]]
end

return function(config)
  local days = matching_days(config)

  if config.week == 'teenth' then
    return first_teenth(days)
  elseif config.week == 'last' then
    return last(days)
  else
    return ordinal(days, config.week)
  end
end
