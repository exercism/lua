local board = {}
board.__index = board

local function Board(rep)
  local board = setmetatable({
    rep = rep,
    width = #rep[1] - 2,
    height = #rep - 2
  }, board)

  for _, row in ipairs(rep) do
    assert(#row == #rep[1], 'board must be a rectangle')
  end

  for x = 1, board.width do
    for y = 1, board.height do
      assert(board:at(x, y):match('[ *]'), 'invalid character on board')
    end
  end

  return board
end

function board:at(x, y)
  if x < 1 or x > self.width then return ' ' end
  if y < 1 or y > self.height then return ' ' end
  return self.rep[y + 1]:sub(x + 1, x + 1)
end

function board:set(x, y, c)
  local v = self.rep[y + 1]
  v = v:sub(1, x) .. c .. v:sub(x + 2)
  self.rep[y + 1] = v
end

function board:neighbors(x, y)
  return coroutine.wrap(function()
    for xx = x - 1, x + 1 do
      for yy = y - 1, y + 1 do
        coroutine.yield(self:at(xx, yy))
      end
    end
  end)
end

function board:empty_spaces()
  return coroutine.wrap(function()
    for x = 1, self.width do
      for y = 1, self.height do
        if self:at(x, y) == ' ' then coroutine.yield(x, y) end
      end
    end
  end)
end

local function transform(board)
  local board = Board(board)

  for x, y in board:empty_spaces() do
    local mines = 0
    for neighbor in board:neighbors(x, y) do
      if neighbor == '*' then mines = mines + 1 end
    end
    if mines > 0 then board:set(x, y, tostring(mines)) end
  end

  return board.rep
end

return {
  transform = transform
}
