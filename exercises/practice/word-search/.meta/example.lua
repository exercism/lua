local grid_api = {}
grid_api.__index = grid_api

function grid_api:at(x, y)
  if x < 1 or x > self._width then
    return ' '
  end
  if y < 1 or y > self._height then
    return ' '
  end
  return self._rep[y]:sub(x, x)
end

function grid_api:locations()
  return coroutine.wrap(function()
    for x = 1, self._width do
      for y = 1, self._height do
        coroutine.yield(x, y)
      end
    end
  end)
end

local function Grid(s)
  return setmetatable({ _rep = s, _width = #s[1], _height = #s }, grid_api)
end

local function find(grid, word, dx, dy)
  for x, y in grid:locations() do
    local xx, yy = x, y
    for i = 1, #word do
      if grid:at(xx, yy) ~= word:sub(i, i) then
        break
      end
      if i == #word then
        return { x, y }, { xx, yy }
      end
      xx, yy = xx + dx, yy + dy
    end
  end
end

local deltas = { { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 }, { 1, 1 }, { 1, -1 }, { -1, 1 }, { -1, -1 } }

return function(grid)
  grid = Grid(grid)

  return {
    search = function(words)
      local result = {}

      for _, word in ipairs(words) do
        for _, delta in ipairs(deltas) do
          local first, last = find(grid, word, delta[1], delta[2])
          if first and last then
            result[word] = { start = first, ['end'] = last }
          end
        end
      end

      return result
    end
  }
end
