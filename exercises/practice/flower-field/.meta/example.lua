local garden = {}
garden.__index = garden

local function Garden(rep)
  local height = #rep
  local width = height > 0 and #rep[1] or 0

  return setmetatable({ rep = rep, width = width, height = height }, garden)
end

function garden:at(x, y)
  if x < 1 or x > self.width then
    return ' '
  end
  if y < 1 or y > self.height then
    return ' '
  end
  return self.rep[y]:sub(x, x)
end

function garden:set(x, y, c)
  local v = self.rep[y]
  v = v:sub(1, x - 1) .. c .. v:sub(x + 1)
  self.rep[y] = v
end

function garden:neighbors(x, y)
  return coroutine.wrap(function()
    for xx = x - 1, x + 1 do
      for yy = y - 1, y + 1 do
        coroutine.yield(self:at(xx, yy))
      end
    end
  end)
end

function garden:empty_spaces()
  return coroutine.wrap(function()
    for x = 1, self.width do
      for y = 1, self.height do
        if self:at(x, y) == ' ' then
          coroutine.yield(x, y)
        end
      end
    end
  end)
end

local function annotate(garden)
  local garden = Garden(garden)

  for x, y in garden:empty_spaces() do
    local flowers = 0
    for neighbor in garden:neighbors(x, y) do
      if neighbor == '*' then
        flowers = flowers + 1
      end
    end
    if flowers > 0 then
      garden:set(x, y, tostring(flowers))
    end
  end

  return garden.rep
end

return { annotate = annotate }
