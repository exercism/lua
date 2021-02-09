return function(s)
  local letters = {}
  s:gsub('[A-Z]*[a-z]*', function(match)
    table.insert(letters, match:sub(1, 1):upper())
  end)
  return table.concat(letters)
end
