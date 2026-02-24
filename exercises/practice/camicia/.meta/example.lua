local function get_value(card)
  if card == 'J' then
    return 1
  elseif card == 'Q' then
    return 2
  elseif card == 'K' then
    return 3
  elseif card == 'A' then
    return 4
  else
    return 0
  end
end

local function simulate_game(playerA, playerB)
  local handA = {}
  for _, card in ipairs(playerA) do
    table.insert(handA, get_value(card))
  end

  local handB = {}
  for _, card in ipairs(playerB) do
    table.insert(handB, get_value(card))
  end

  local turn = 'A'
  local pile = {}
  local seen = {}
  local totalTricks = 0
  local cardsPlayed = 0
  local currentDebt = 0

  while true do
    if #pile == 0 then
      local round = table.concat(handA, ",") .. "|" .. table.concat(handB, ",") .. "|" .. turn
      if seen[round] then
        return { status = 'loop', tricks = totalTricks, cards = cardsPlayed }
      end
      seen[round] = true
    end

    local activeHand = turn == 'A' and handA or handB
    local otherHand = turn == 'A' and handB or handA

    if #activeHand == 0 then
      local extraTrick = #pile == 0 and 0 or 1
      return { status = 'finished', tricks = totalTricks + extraTrick, cards = cardsPlayed }
    end

    local cardVal = table.remove(activeHand, 1)
    table.insert(pile, cardVal)
    cardsPlayed = cardsPlayed + 1

    if cardVal > 0 then
      currentDebt = cardVal
      if turn == 'A' then
        turn = 'B'
      else
        turn = 'A'
      end
    elseif currentDebt > 0 then
      currentDebt = currentDebt - 1
      if currentDebt == 0 then
        for _, p in ipairs(pile) do
          table.insert(otherHand, p)
        end
        pile = {}
        totalTricks = totalTricks + 1
        currentDebt = 0

        if #handA == 0 or #handB == 0 then
          return { status = 'finished', tricks = totalTricks, cards = cardsPlayed }
        end

        if turn == 'A' then
          turn = 'B'
        else
          turn = 'A'
        end
      end
    else
      if turn == 'A' then
        turn = 'B'
      else
        turn = 'A'
      end
    end
  end
end

return { simulate_game = simulate_game }
