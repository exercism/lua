return function()
  local current = {}
  local frames = {}

  local function strike()
    return current[1] == 10
  end

  local function spare()
    return current[1] + current[2] == 10
  end

  local function complete()
    return #frames == 10
  end

  return {
    roll = function(pins)
      assert(not complete(), 'the game is already over')
      assert(pins >= 0 and pins <= 10, 'illegal roll')

      table.insert(current, pins)

      if #current == 3 and strike() then
        assert(current[2] == 10 or current[2] + current[3] <= 10, 'illegal roll')
        table.insert(frames, current[1] + current[2] + current[3])
        table.remove(current, 1)
      end

      if #current == 3 and spare() then
        table.insert(frames, current[1] + current[2] + current[3])
        table.remove(current, 1)
        table.remove(current, 1)
      end

      if #frames < 10 and #current == 2 and not spare() and not strike() then
        local total = current[1] + current[2]
        assert(total <= 10, 'illegal roll')
        table.insert(frames, total)
        table.remove(current, 1)
        table.remove(current, 1)
      end
    end,

    score = function()
      assert(complete(), 'the game is not yet over')

      local score = 0
      for _, frame_score in ipairs(frames) do
        score = score + frame_score
      end
      return score
    end
  }
end
