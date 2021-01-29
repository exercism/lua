local function Grid(s)
  local width = 0
  local rows = {}
  for row in s:gmatch('([^\n]*)\n?') do
    table.insert(rows, row)
    width = math.max(width, #row)
  end

  return {
    at = function(x, y)
      return rows[y]:sub(x, x):match('.')
    end,
    height = #rows,
    width = width
  }
end

return function(s)
  local grid = Grid(s)
  local rows = {}
  for x = 1, grid.width do
    local row = {}
    for y = 1, grid.height do
      if grid.at(x, y) then
        while #row < y - 1 do table.insert(row, ' ') end
        table.insert(row, grid.at(x, y))
      end
    end
    table.insert(rows, table.concat(row))
  end
  return table.concat(rows, '\n')
end
