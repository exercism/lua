local combinations

local function generate_combinations(a, n, offset)
  if n > (#a - offset) then
    return
  end

  if n == 0 then
    coroutine.yield({})
    return
  end

  for v in combinations(a, n - 1, offset + 1) do
    table.insert(v, 1, a[1 + offset])
    coroutine.yield(v)
  end

  for v in combinations(a, n, offset + 1) do
    coroutine.yield(v)
  end
end

function combinations(a, n, offset)
  return coroutine.wrap(function() generate_combinations(a, n, offset or 0) end)
end

local function normalize_corners(corners)
  local copy = { corners[1], corners[2], corners[3], corners[4] }
  table.sort(copy, function(a, b)
    return a.x < b.x and a.y > b.y
  end)
  return copy[1], copy[2], copy[3], copy[4]
end

local function horizontal_line_connecting(c1, c2, grid)
  if c1.y ~= c2.y then return false end

  local horizontal_segment = { ['-'] = true, ['+'] = true }

  local y = c1.y
  for x = c1.x, c2.x do
    if not horizontal_segment[grid[y]:sub(x, x)] then
      return false
    end
  end
  return true
end

local function vertical_line_connecting(c1, c2, grid)
  if c1.x ~= c2.x then return false end

  local vertical_segment = { ['|'] = true, ['+'] = true }

  local x = c1.x
  for y = c1.y, c2.y do
    if not vertical_segment[grid[y]:sub(x, x)] then
      return false
    end
  end
  return true
end

local function forms_rectangle(corners, grid)
  local c1, c2, c3, c4 = normalize_corners(corners)
  return
    vertical_line_connecting(c1, c2, grid) and
    vertical_line_connecting(c3, c4, grid) and
    horizontal_line_connecting(c1, c3, grid) and
    horizontal_line_connecting(c2, c4, grid)
end

local function corners(grid)
  local corners = {}
  for row_i, row in ipairs(grid) do
    for col_i = 1, #row do
      if row:sub(col_i, col_i) == '+' then
        table.insert(corners, { x = col_i, y = row_i })
      end
    end
  end
  return corners
end

return {
  count = function(grid)
    local rectangles = 0
    for combination in combinations(corners(grid), 4) do
      if forms_rectangle(combination, grid) then
        rectangles = rectangles + 1
      end
    end
    return rectangles
  end
}
