local ones = {
  [1] = 'one',
  [2] = 'two',
  [3] = 'three',
  [4] = 'four',
  [5] = 'five',
  [6] = 'six',
  [7] = 'seven',
  [8] = 'eight',
  [9] = 'nine'
}

local teens = {
  [10] = 'ten',
  [11] = 'eleven',
  [12] = 'twelve',
  [13] = 'thirteen',
  [14] = 'fourteen',
  [15] = 'fifteen',
  [16] = 'sixteen',
  [17] = 'seventeen',
  [18] = 'eighteen',
  [19] = 'nineteen',
}

local tens = {
  [2] = 'twenty',
  [3] = 'thirty',
  [4] = 'forty',
  [5] = 'fifty',
  [6] = 'sixty',
  [7] = 'seventy',
  [8] = 'eighty',
  [9] = 'ninety'
}

local group_name = {
  'thousand',
  'million',
  'billion'
}

local function say_group(n)
  local said = ''

  if n // 100 > 0 then
    said = said .. ones[n // 100] .. ' hundred'
    n = n - (n // 100) * 100
    if n > 0 then said = said .. ' ' end
  end

  if tens[n // 10] then
    said = said .. tens[n // 10]
    n = n - (n // 10) * 10
    if n > 0 then said = said .. '-' end
  end

  if teens[n] then
    said = said .. teens[n]
  elseif ones[n] then
    said = said .. ones[n]
  end

  return said
end

return function(n)
  if n < 0 or n > 999999999999 then return -1 end

  local groups = {}
  local group_index = 0

  while n > 0 do
    local group = say_group(n % 1000)

    if group ~= '' then
      if group_name[group_index] then
        group = group .. ' ' .. group_name[group_index]
      end
      table.insert(groups, 1, group)
    end

    n = n // 1000
    group_index = group_index + 1
  end

  if #groups == 0 then
    return 'zero'
  else
    return table.concat(groups, ' ')
  end
end
