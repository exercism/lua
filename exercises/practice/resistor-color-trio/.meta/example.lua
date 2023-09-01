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
  decode = function(colors)
    local c1 = colors[1]
    local c2 = colors[2]
    local c3 = colors[3]
    local value = (value[c1] * 10 + value[c2]) * 10 ^ value[c3]

    if value >= 1e9 then
      return value / 1e9, 'gigaohms'
    elseif value >=  1e6 then
      return value / 1e6, 'megaohms'
    elseif value >= 1e3 then
      return value / 1e3, 'kiloohms'
    else
      return value, 'ohms'
    end
  end
}
