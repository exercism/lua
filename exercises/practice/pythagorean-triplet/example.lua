return function(sum)
  local triplets = {}

  for a = 1, sum // 3 - 1 do
    for b = a, (sum - a) // 2 do
      local c = sum - a - b

      if a ^ 2 + b ^ 2 == c ^ 2 then
        table.insert(triplets, { a, b, c })
      end
    end
  end

  return triplets
end
