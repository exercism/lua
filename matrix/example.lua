return function(s)
  local rows = {}
  s:gsub('[%w ]+', function(row_string)
    local row = {}
    row_string:gsub('%w+', function(v)
      table.insert(row, tonumber(v))
    end)
    table.insert(rows, row)
  end)

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
