local Luhn = {}
Luhn.__index = Luhn

function Luhn:check_digit()
  return tonumber(self.s:sub(-1))
end

function Luhn:addends()
  local result = {}
  for i = #self.s, 1, -1 do
    local digit = tonumber(self.s:sub(i, i))
    if #result % 2 > 0 then digit = digit * 2 end
    if digit > 9 then digit = digit - 9 end
    table.insert(result, 1, digit)
  end
  return result
end

function Luhn:checksum()
  local checksum = 0
  for _, addend in ipairs(self:addends()) do
    checksum = checksum + addend
  end
  return checksum
end

function Luhn:valid()
  return self:checksum() % 10 == 0
end

local function new(s)
  return setmetatable({ s = s }, Luhn)
end

local function create(s)
  local checksum = new(s .. '0'):checksum()
  return s .. tostring((10 - (checksum % 10)) % 10)
end

return {
  new = new,
  create = create
}
