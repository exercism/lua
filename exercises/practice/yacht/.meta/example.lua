local yacht = {}

local function count_of(dice, value)
  local count = 0
  for _, v in ipairs(dice) do
    if v == value then
      count = count + 1
    end
  end
  return count
end

local function has_count(dice, count)
  for value = 1, 6 do
    if count_of(dice, value) == count then
      return true
    end
  end
  return false
end

local function value_with_minimum_count_or_zero(dice, count)
  for value = 1, 6 do
    if count_of(dice, value) >= count then
      return value
    end
  end
  return 0
end

local function sum(dice)
  local sum = 0
  for _, die in ipairs(dice) do
    sum = sum + die
  end
  return sum
end

local function sum_of(dice, value)
  local sum = 0
  for _, die in ipairs(dice) do
    if die == value then
      sum = sum + die
    end
  end
  return sum
end

local function uniques(dice)
  local count = 0
  for value = 1, 6 do
    if count_of(dice, value) > 0 then
      count = count + 1
    end
  end
  return count
end

yacht.score = function(dice, category)
  if category == 'ones' then
    return sum_of(dice, 1)
  elseif category == 'twos' then
    return sum_of(dice, 2)
  elseif category == 'threes' then
    return sum_of(dice, 3)
  elseif category == 'fours' then
    return sum_of(dice, 4)
  elseif category == 'fives' then
    return sum_of(dice, 5)
  elseif category == 'sixes' then
    return sum_of(dice, 6)
  elseif category == 'full house' then
    return (has_count(dice, 2) and has_count(dice, 3)) and sum(dice) or 0
  elseif category == 'four of a kind' then
    return value_with_minimum_count_or_zero(dice, 4) * 4
  elseif category == 'little straight' then
    return (uniques(dice) == 5 and count_of(dice, 6) == 0) and 30 or 0
  elseif category == 'big straight' then
    return (uniques(dice) == 5 and count_of(dice, 1) == 0) and 30 or 0
  elseif category == 'choice' then
    return sum(dice)
  elseif category == 'yacht' then
    return count_of(dice, dice[1]) == 5 and 50 or 0
  end
  return 0
end

return yacht
