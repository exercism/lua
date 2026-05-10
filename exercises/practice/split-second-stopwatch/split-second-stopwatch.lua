local Stopwatch = {}

function Stopwatch:new()
  local obj = {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Stopwatch:start()
end

function Stopwatch:stop()
end

function Stopwatch:reset()
end

function Stopwatch:advance_time(timestamp)
end

function Stopwatch:total()
end

function Stopwatch:lap()
end

function Stopwatch:current_lap()
end

function Stopwatch:previous_laps()
end

function Stopwatch:state()
end

return Stopwatch
