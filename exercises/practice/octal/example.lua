local function to_decimal(s)
  local decimal = 0
  for i = #s, 1, -1 do
    local digit = tonumber(s:sub(i, i))
    if not digit or digit >= 8 then return 0 end
    decimal = decimal + digit * 8 ^ (#s - i)
  end
  return decimal
end

return function(s)
  return {
    to_decimal = function() return to_decimal(s) end
  }
end
