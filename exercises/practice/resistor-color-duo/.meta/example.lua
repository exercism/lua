local color_code = {
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
  value = function(colors)
    return color_code[colors[1]] * 10 + color_code[colors[2]]
  end
}
