return function(n)
  local rows = {}

  for i = 1, n do
    local row = {}
    local previous = rows[i - 1]
    for j = 1, i do
      if j == 1 or j == i then
        row[j] = 1
      else
        row[j] = previous[j - 1] + previous[j]
      end
    end
    table.insert(rows, row)
  end

  return { rows = rows, last_row = rows[#rows] }
end
