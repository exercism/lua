return function(s)
  local seen = {}
  for c in s:lower():gmatch('%a') do
    if seen[c] then return false end
    seen[c] = true
  end
  return true
end
