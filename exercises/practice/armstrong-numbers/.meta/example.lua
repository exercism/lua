local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  local digits = tostring(number)
  local pow_special = function(digit)
    return tonumber(digit) ^ string.len(digits)
  end

  local sum = 0
  for i = 1, string.len(digits) do
    local digit = tonumber(string.sub(digits, i, i))
    sum = sum + pow_special(digit)
  end

  return sum == number
end

return ArmstrongNumbers
