return function(size)
  local matrix = {}
  for i = 1, size do
    matrix[i] = {}
    for j = 1, size do
      matrix[i][j] = 0
    end
  end

  local x, y = 1, 1
  local dx, dy = 1, 0

  for i = 1, size * size do
    matrix[y][x] = i
    local at_edge = (x + dx > size) or (x + dx < 1) or (y + dy > size) or (y + dy < 1)
    if at_edge or (matrix[y + dy][x + dx] ~= 0) then
      dx, dy = -dy, dx
    end
    x = x + dx
    y = y + dy
  end

  return matrix
end
