local CircularBuffer = {}

function CircularBuffer:new(size)
    self.__index = self
    local s = size or 0
    return setmetatable({ size = s, buffer = {} }, self)
end

function CircularBuffer:read()
    assert(#self.buffer > 0, "buffer is empty")
    return table.remove(self.buffer, 1)
end

function CircularBuffer:write(data)
    if (data) then
        assert(self.size > #self.buffer, "buffer is full")
        table.insert(self.buffer, data)
    end
end

function CircularBuffer:forceWrite(data)
    self:read()
    table.insert(self.buffer, data)
end

function CircularBuffer:clear()
    self.buffer = {}
end

return CircularBuffer