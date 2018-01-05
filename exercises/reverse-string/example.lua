return function(s)
  local reversed = ''
  for c in s:gmatch('.') do
    reversed = c .. reversed
  end
  return reversed
end
