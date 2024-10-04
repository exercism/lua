local function gamestate(board)
  local lines = { 0x007, 0x070, 0x700, 0x111, 0x222, 0x444, 0x124, 0x421 }

  local bitset_x = 0
  local bitset_o = 0
  local count_x = 0
  local count_o = 0

  for row = 1, 3 do
    for column = 1, 3 do
      local mark = board[row]:sub(column, column)
      if mark == 'X' then
        bitset_x = bitset_x | (1 << (row * 4 + column - 5))
        count_x = count_x + 1
      elseif mark == 'O' then
        bitset_o = bitset_o | (1 << (row * 4 + column - 5))
        count_o = count_o + 1
      end
    end
  end

  assert(count_x <= count_o + 1, 'Wrong turn order: X went twice')
  assert(count_o <= count_x, 'Wrong turn order: O started')

  local win_x = {}
  local win_o = {}

  for _, line in ipairs(lines) do
    if (bitset_x & line) == line then
      table.insert(win_x, line)
    elseif (bitset_o & line) == line then
      table.insert(win_o, line)
    end
  end

  assert(#win_x == 0 or #win_o == 0, 'Impossible board: game should have ended after the game was won')

  if #win_x > 0 or #win_o > 0 then
    return 'win'
  end

  if count_x + count_o == 9 then
    return 'draw'
  end

  return 'ongoing'
end

return { gamestate = gamestate }
