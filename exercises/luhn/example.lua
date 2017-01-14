local function addends(s)
  local result = {}
  for i = #s, 1, -1 do
    local digit = tonumber(s:sub(i, i))
    if #result % 2 > 0 then digit = digit * 2 end
    if digit > 9 then digit = digit - 9 end
    table.insert(result, 1, digit)
  end
  return result
end

local function checksum(s)
  local checksum = 0
  for _, addend in ipairs(addends(s)) do
    checksum = checksum + addend
  end
  return checksum
end

return {
  valid = function(s)
    s = s:gsub(' ', '')
    if #s < 2 then return false end
    if s:find('%D') then return false end
    return checksum(s) % 10 == 0
  end
}
