return function(amount, values)
  assert(amount >= 0, "target can't be negative")
  if amount == 0 then
    return {}
  end

  local counts = {}
  local coins = {}
  for total = 1, amount do
    local best_count = amount + 1
    local best_coin = 0
    for _, value in ipairs(values) do
      if value == total then
        best_count = 1
        best_coin = value
      elseif total > value then
        local count = counts[total - value] + 1
        if count < best_count then
          best_count = count
          best_coin = value
        end
      end
    end
    table.insert(counts, best_count)
    table.insert(coins, best_coin)
  end

  assert(counts[amount] <= amount, "can't make target with given coins")

  local result = {}
  local remaining = amount
  while remaining > 0 do
    table.insert(result, coins[remaining])
    remaining = remaining - coins[remaining]
  end
  return result
end
