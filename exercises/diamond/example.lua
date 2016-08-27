local function offset(letter)
  return letter:byte() - ('A'):byte()
end

local function row(which, current)
  local outer_padding = (' '):rep(offset(which) - offset(current))

  local row = (' '):rep(offset(which) * 2 + 1)
  row = row:gsub('^' .. outer_padding .. '.', outer_padding .. current)
  row = row:gsub('.' .. outer_padding .. '$', current .. outer_padding)
  return row .. '\n'
end

return function(which)
  local diamond = row(which, which)
  for i = which:byte() - 1, ('A'):byte(), -1 do
    local row = row(which, string.char(i))
    diamond = row .. diamond .. row
  end
  return diamond
end
