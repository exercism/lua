local triangle = {}

function triangle.kind(a, b, c)
  local function violates_inequality()
    local sides = { a, b, c }
    table.sort(sides)
    return sides[1] + sides[2] <= sides[3]
  end

  if (a <= 0 or b <= 0 or c <= 0 or violates_inequality()) then
    error("Input Error")
  end
  if (a == b and a == c) then
    return "equilateral"
  end
  if (a == b or a == c or c == b) then
    return "isosceles"
  end
  return "scalene"
end

return triangle
