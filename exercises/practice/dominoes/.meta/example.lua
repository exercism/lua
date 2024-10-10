local function reversed(domino)
  return { domino[2], domino[1] }
end

local function without_domino(dominoes, target)
  local without = {}
  for i = 1, #dominoes do
    if i ~= target then
      table.insert(without, dominoes[i])
    end
  end
  return without
end

local function can_chain(dominoes)
  if #dominoes == 0 then
    return true
  end

  local function recur(left, dominoes, right)
    if #dominoes == 0 then
      return left == right
    end

    for i, domino in ipairs(dominoes) do
      for _, domino in ipairs({ domino, reversed(domino) }) do
        if domino[1] == left and recur(domino[2], without_domino(dominoes, i), right) then
          return true
        end
      end
    end

    return false
  end

  return recur(dominoes[1][1], without_domino(dominoes, 1), dominoes[1][2])
end

return { can_chain = can_chain }
