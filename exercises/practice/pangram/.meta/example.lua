return function(s)
  local letters = {}
  for c in s:lower():gmatch('%a') do
    letters[c:byte()] = true
  end
  for i = ('a'):byte(), ('z'):byte() do
    if not letters[i] then return false end
  end
  return true
end
