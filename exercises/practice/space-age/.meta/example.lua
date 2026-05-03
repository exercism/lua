local SpaceAge = {}

SpaceAge.EARTH_ORBITAL_PERIOD = 31557600
SpaceAge.ORBITAL_PERIODS = {
  earth = 1.0,
  mercury = 0.2408467,
  venus = 0.61519726,
  mars = 1.8808158,
  jupiter = 11.862615,
  saturn = 29.447498,
  uranus = 84.016846,
  neptune = 164.79132
}

local function round(val, decimal)
  local exp = 10 ^ decimal
  return math.ceil(val * exp - 0.5) / exp
end

function SpaceAge:new(seconds)
  local o = {}
  for k, v in pairs(SpaceAge.ORBITAL_PERIODS) do
    local val = round(seconds / SpaceAge.EARTH_ORBITAL_PERIOD / v, 2)
    o['on_' .. k] = load('return ' .. val)
  end

  return setmetatable(o, {
    __index = function(_, key)
      return function()
        error('not a planet')
      end
    end
  })
end

return SpaceAge
