return function(amount, values)
  local index, sorted_values, result = {}, {}, {}

  for i, v in ipairs(values) do
    index[v] = i
    sorted_values[i] = v
  end

  table.sort(sorted_values, function(a, b) return b < a end)

  for i, value in ipairs(sorted_values) do
    result[index[value]] = amount // value
    amount = amount % value
  end

  return amount == 0 and result or nil
end
