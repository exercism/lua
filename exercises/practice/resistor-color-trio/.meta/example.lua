local value = {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9
}

return {
  decode = function(c1, c2, c3)
    local value = (value[c1] * 10 + value[c2]) * 10 ^ value[c3]

    if value > 1000 then
      return value / 1000, 'kiloohms'
    else
      return value, 'ohms'
    end
  end
}
