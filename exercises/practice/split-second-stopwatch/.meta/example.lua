local function timestamp_from_seconds(seconds)
  local hours = math.floor(seconds / 3600)
  local minutes = math.floor((seconds % 3600) / 60)
  local secs = seconds % 60
  return string.format('%02d:%02d:%02d', hours, minutes, secs)
end

local function seconds_from_timestamp(timestamp)
  local hours, minutes, seconds = timestamp:match("(%d+):(%d+):(%d+)")
  return tonumber(hours) * 3600 + tonumber(minutes) * 60 + tonumber(seconds)
end

local Stopwatch = {}

function Stopwatch:new()
  local obj = { _state = 'stopped' }
  setmetatable(obj, self)
  self.__index = self
  obj:reset()
  return obj
end

function Stopwatch:start()
  assert(self._state ~= 'running', 'cannot start an already running stopwatch')
  self._state = 'running'
end

function Stopwatch:stop()
  assert(self._state == 'running', 'cannot stop a stopwatch that is not running')
  self._state = 'stopped'
end

function Stopwatch:reset()
  assert(self._state == 'stopped', 'cannot reset a stopwatch that is not stopped')
  self._state = 'ready'
  self._total_time = 0
  self._lap_time = 0
  self._previous_laps = {}
end

function Stopwatch:advance_time(timestamp)
  if self._state == 'running' then
    local time_in_seconds = seconds_from_timestamp(timestamp)
    self._total_time = self._total_time + time_in_seconds
    self._lap_time = self._lap_time + time_in_seconds
  end
end

function Stopwatch:total()
  return timestamp_from_seconds(self._total_time)
end

function Stopwatch:lap()
  assert(self._state == 'running', 'cannot lap a stopwatch that is not running')
  table.insert(self._previous_laps, timestamp_from_seconds(self._lap_time))
  self._lap_time = 0
end

function Stopwatch:current_lap()
  return timestamp_from_seconds(self._lap_time)
end

function Stopwatch:previous_laps()
  return self._previous_laps
end

function Stopwatch:state()
  return self._state
end

return Stopwatch
