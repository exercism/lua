local SpaceAge = {}

SpaceAge.EARTH_ORBITAL_PERIOD = 31557600
SpaceAge.ORBITAL_PERIODS = {
    Earth = 1.0,
    Mercury = 0.2408467,
    Venus = 0.61519726,
    Mars = 1.8808158,
    Jupiter = 11.862615,
    Saturn = 29.447498,
    Uranus = 84.016846,
    Neptune = 164.79132
}

local function round(val, decimal)
    local exp = 10 ^ decimal
    return math.ceil(val * exp - 0.5) / exp
end

function SpaceAge:new(seconds)
    self.__index = self
    meta_tbl = { seconds = seconds }
    for k, v in pairs(SpaceAge.ORBITAL_PERIODS) do
        local val = round(seconds / SpaceAge.EARTH_ORBITAL_PERIOD / v, 2)
        meta_tbl["on" .. k] = loadstring("return " .. val)
    end

    return setmetatable(meta_tbl, self)
end

return SpaceAge