local function Board(board)
  local function at(x, y)
    return board[y + 1]:sub(x + 1, x + 1)
  end

  local function put(x, y, v)
    board[y + 1] = board[y + 1]:sub(1, x) .. v .. board[y + 1]:sub(x + 2)
  end

  local function on_board(x, y)
    return x >= 0 and x <= #board[1] - 1 and y >= 0 and y <= #board - 1
  end

  local function max_x()
    return #board[1] - 1
  end

  local function max_y()
    return #board - 1
  end

  local function each_position(f)
    for x = 0, max_x() do
      for y = 0, max_y() do
        f(x, y)
      end
    end
  end

  local function each_neighbor(x, y, f)
    local neighbors = { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 }, { -1, 1 }, { 1, -1 } }
    for _, neighbor in ipairs(neighbors) do
      local dx, dy = neighbor[1], neighbor[2]
      local xx, yy = x + dx, y + dy
      if on_board(xx, yy) then
        f(xx, yy)
      end
    end
  end

  local function mark_xs_at_left()
    for y = 0, max_y() do
      if at(0, y) == 'X' then
        put(0, y, 'x')
      end
    end
  end

  local function mark_os_at_top()
    for x = 0, max_x() do
      if at(x, 0) == 'O' then
        put(x, 0, 'o')
      end
    end
  end

  local function traverse(player)
    local marked = false

    each_position(function(x, y)
      if at(x, y) == player then
        each_neighbor(x, y, function(nx, ny)
          if at(nx, ny) == player:lower() then
            put(x, y, player:lower())
            marked = true
          end
        end)
      end
    end)

    return marked
  end

  local function mark()
    mark_xs_at_left()
    while traverse('X') do
    end

    mark_os_at_top()
    while traverse('O') do
    end
  end

  local function x_at_right()
    for i = 0, max_y() do
      if at(max_x(), i) == 'x' then
        return true
      end
    end
    return false
  end

  local function o_at_bottom()
    for i = 0, max_x() do
      if at(i, max_y()) == 'o' then
        return true
      end
    end
  end

  for i = 1, #board do
    board[i] = board[i]:gsub(' ', '')
  end

  mark()

  return {
    winner = function()
      if x_at_right() then
        return 'X'
      elseif o_at_bottom() then
        return 'O'
      else
        return ''
      end
    end
  }
end

return {
  winner = function(board)
    return Board(board).winner()
  end
}
