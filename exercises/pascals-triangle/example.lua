return function(n)
  local rows = { { 1 } }

  for i = 1, n - 1 do
    local row = {}
    for j = 1, i + 1 do
      row[j] = (rows[i][j - 1] or 0) + (rows[i][j] or 0)
    end
    table.insert(rows, row)
  end

  return {
    rows = rows,
    last_row = rows[#rows]
  }
end
