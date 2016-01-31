-- In Lua Time is only available in seconds
-- http://stackoverflow.com/questions/463101/lua-current-time-in-milliseconds
local gigasecond = {}

function gigasecond.anniversary(any_date)
  return os.date('%x', any_date + math.pow(10, 9))
end

return gigasecond
