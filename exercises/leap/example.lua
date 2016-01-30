local leap_year = function(number)
  local function is_divisible_by(a_number)
    return number % a_number == 0
  end

  return is_divisible_by(400) or (is_divisible_by(4) and (not is_divisible_by(100)))
end

return leap_year
