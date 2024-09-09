return function(matrix)
  if #matrix == 0 or #matrix[1] == 0 then
    return {}
  end

  local row_max = {}
  local column_min = {}

  for i, row in ipairs(matrix) do
    row_max[i] = math.max(table.unpack(row))
  end

  for column = 1, #matrix[1] do
    local column_values = {}
    for _, row in ipairs(matrix) do
      table.insert(column_values, row[column])
    end
    column_min[column] = math.min(table.unpack(column_values))
  end

  local saddle_points = {}

  for row = 1, #matrix do
    for column = 1, #matrix[1] do
      if matrix[row][column] == row_max[row] and matrix[row][column] == column_min[column] then
        table.insert(saddle_points, { row = row, column = column })
      end
    end
  end

  return saddle_points
end
