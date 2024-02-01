local function maximum_value(maximum_weight, items)
  local table = {}
  for i = 0, #items do
    table[i] = {}
    for j = 0, maximum_weight do
      table[i][j] = 0
    end
  end

  for i = 0, #items - 1 do
    for capacity = 1, maximum_weight do
      local weight = items[i + 1].weight
      local value = items[i + 1].value

      if weight > capacity then
        table[i + 1][capacity] = table[i][capacity]
      elseif table[i][capacity] <= value + table[i][capacity - weight] then
        table[i + 1][capacity] = value + table[i][capacity - weight]
      else
        table[i + 1][capacity] = table[i][capacity]
      end
    end
  end

  return table[#items][maximum_weight]
end

return { maximum_value = maximum_value }
