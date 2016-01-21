Year = function(number)
    local function isDivisibleBy(a_number)
        return number % a_number == 0
    end

    return isDivisibleBy(400) or (isDivisibleBy(4) and (not isDivisibleBy(100)))
end

return Year
