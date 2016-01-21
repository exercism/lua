local function copy(a)
  local copy = {}
  for i, v in ipairs(a) do copy[i] = v end
  return copy
end

local function sum(a)
  local sum = 0
  for _, v in ipairs(a) do sum = sum + v end
  return sum
end

local function sorted(a)
  local sorted = copy(a)
  table.sort(sorted, function(a, b) return a > b end)
  return sorted
end

local function invert(a)
  local inverted = {}
  for i, v in ipairs(a) do inverted[v] = i end
  return inverted
end

local function array_of_zeros(size)
  local a = {}
  for i = 1, size do a[i] = 0 end
  return a
end

return function(amount, values)
  local chosen = array_of_zeros(#values)
  local minimum_coins = math.huge
  local best = nil
  local sorted_values = sorted(values)
  local value_index = invert(values)

  local function aux(amount, count)
    if amount == 0 then return copy(chosen) end
    if amount < 0 or count > minimum_coins then return nil end

    count = count + 1

    for _, value in ipairs(sorted_values) do
      chosen[value_index[value]] = chosen[value_index[value]] + 1
      local option = aux(amount - value, count)
      if option then
        minimum_coins = count
        best = option
      end
      chosen[value_index[value]] = chosen[value_index[value]] - 1
    end

    return best
  end

  return aux(amount, 0)
end
