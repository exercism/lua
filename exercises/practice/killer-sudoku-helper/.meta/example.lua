local function clone(original)
  local result = {}
  for k, v in ipairs(original) do
    result[k] = v
  end
  return result
end

local function combinations(sum, size, exclude)
  local excluded = {}
  local result = {}
  local combination = {}

  if exclude then
    for _, v in ipairs(exclude) do
      excluded[v] = true
    end
  end

  local function search(total, count, start)
    if count == 0 then
      if total == 0 then
        table.insert(result, clone(combination))
      end

      return
    end

    for number = start, 9 do
      if not excluded[number] then
        combination[size - count + 1] = number
        search(total - number, count - 1, number + 1)
      end
    end
  end

  search(sum, size, 1)
  return result
end

return { combinations = combinations }
