local function in_matrix(matrix, x, y)
  return y >= 1 and y <= #matrix and x >= 1 and x <= #matrix[1]
end

local function neighbors(matrix, x, y)
  return coroutine.wrap(function()
    for dx = -1, 1 do
      for dy = -1, 1 do
        if dx ~= 0 or dy ~= 0 then
          if in_matrix(matrix, x + dx, y + dy) then
            coroutine.yield(matrix[y + dy][x + dx])
          end
        end
      end
    end
  end)
end

local function neighbor_count(matrix, x, y)
  local neighbor_count = 0
  for neighbor in neighbors(matrix, x, y) do
    neighbor_count = neighbor_count + neighbor
  end
  return neighbor_count
end

local function tick(matrix)
  local next = {}

  for y = 1, #matrix do
    next[y] = {}

    for x = 1, #matrix[y] do
      local neighbor_count = neighbor_count(matrix, x, y)

      if matrix[y][x] == 1 then
        next[y][x] = (neighbor_count < 2 or neighbor_count > 3) and 0 or 1
      else
        next[y][x] = neighbor_count == 3 and 1 or 0
      end
    end
  end

  return next
end

return { tick = tick }
