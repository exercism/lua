local function to_decimal(input)
  if string.match(input,'%D') then return 0 end
  local str = string.reverse(input)
  local decimal = 0
  for i = 1, #str do
    local c = str:sub(i,i)
    decimal = decimal + c * (2 ^ (i - 1))
  end
  return decimal
end

return {
  to_decimal = to_decimal
}
