function multiplyLetter(letter, multiple)
    local letters = ""
    for i = 1, multiple do
        letters = letters .. letter
    end
    return letters
end

-- No switch statement in Lua
function roman(digit, place_value)
    if (digit < 4) then
        if (place_value == 4) then return multiplyLetter('M', digit) end
        if (place_value == 3) then return multiplyLetter('C', digit) end
        if (place_value == 2) then return multiplyLetter('X', digit) end
        if (place_value == 1) then return multiplyLetter('I', digit) end
    end
    if (digit == 4) then
        if (place_value == 3) then return 'CD' end
        if (place_value == 2) then return 'XL' end
        if (place_value == 1) then return 'IV' end
    end
    if (digit == 5) then
        if (place_value == 3) then return 'D' end
        if (place_value == 2) then return 'L' end
        if (place_value == 1) then return 'V' end
    end
    if (digit > 5 and digit < 9) then
        if (place_value == 3) then return 'D' .. multiplyLetter('C', digit - 5) end
        if (place_value == 2) then return 'L' .. multiplyLetter('X', digit - 5) end
        if (place_value == 1) then return 'V' .. multiplyLetter('I', digit - 5) end
    end
    if (digit == 9) then
        if (place_value == 3) then return 'CM' end
        if (place_value == 2) then return 'XC' end
        if (place_value == 1) then return 'IX' end
    end
end

-- Convert number to string array
function numberToStringArr(number)
    local number_arr = {}
    tostring(number):gsub(".", function(c) table.insert(number_arr, c) end)
    return number_arr
end

local toRoman = function(number)
    if (number < 1 or number > 3999) then
        return "Roman Number Not Computable"
    end
    roman_number = ""
    number_arr = numberToStringArr(number)
    for i = 1, #number_arr do
        digit = tonumber(number_arr[i])
        place_value = #number_arr - i + 1
        roman_number = roman_number .. roman(digit, place_value)
    end
    return roman_number
end

return toRoman