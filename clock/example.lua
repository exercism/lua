local Clock = {}

function Clock.tostring(t)
    local function format(n)
        if (n >= 10) then
            return n
        else
            return "0" .. n
        end
    end

    return format(t.hour) .. ":" .. format(t.minute)
end

function Clock:new(hour, minute)
    self.__index = self
    self.__tostring = Clock.tostring
    local h = hour or 0
    local m = minute or 0
    local p = Clock.plus
    return setmetatable({ hour = h, minute = m }, self)
end

function Clock:plus(minutes)
    local computed_minutes = self.minute + minutes
    if (computed_minutes > 60) then
        self.minute = computed_minutes % 60
        self.hour = self.hour + computed_minutes / 60
    else
        self.minute = computed_minutes
    end
    if (self.hour >= 24) then
        self.hour = self.hour - 24
    end
    self.hour = math.floor(self.hour)
    self.minute = math.floor(self.minute)
    return self
end

function Clock:minus(minutes)
    local computed_minutes = self.minute - minutes
    if (computed_minutes < 0) then
        self.minute = computed_minutes % 60
        self.hour = self.hour - (math.abs(computed_minutes / 60))
    else
        self.minute = computed_minutes
    end
    if (self.hour < 0) then
        self.hour = 24 + self.hour
    end

    self.hour = math.floor(self.hour)
    self.minute = math.floor(self.minute)

    return self
end

function Clock:equals(other)
    return self.hour == other.hour and self.minute == other.minute
end

function Clock.at(hour, minute)
    local c = Clock:new(hour, minute)
    return c
end

return Clock