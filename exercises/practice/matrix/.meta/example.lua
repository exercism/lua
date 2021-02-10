return function(s)
  local rows = {}

  for line in s:gmatch('[%d ]+') do
    local row = {}
    for element in line:gmatch('%d+') do
      table.insert(row, tonumber(element))
    end
    table.insert(rows, row)
  end

  return {
    row = function(which)
      return rows[which]
    end,

    column = function(which)
      local column = {}
      for _, row in ipairs(rows) do
        table.insert(column, row[which])
      end
      return column
    end
  }
end
