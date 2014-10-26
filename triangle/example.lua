local Triangle = {}

function Triangle.kind(a, b, c)
    local function violatesInequality()
        local sides = { a, b, c }
        table.sort(sides)
        return sides[1] + sides[2] <= sides[3]
    end

    if (a <= 0 or b <= 0 or c <= 0 or violatesInequality()) then
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

return Triangle