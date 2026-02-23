local function findSequence(start, prisms)
  local x, y, angle = start.x, start.y, start.angle
  local sequence = {}

  while true do
    local rad = angle * math.pi / 180
    local dirX = math.cos(rad)
    local dirY = math.sin(rad)

    local nearest = nil
    local nearestDist = math.huge

    for _, prism in ipairs(prisms) do
      local dx = prism.x - x
      local dy = prism.y - y

      local dist = dx * dirX + dy * dirY
      -- ignore prisms behind or at the start
      if dist > 1e-6 then
        local crossSq = (dx - dist * dirX) ^ 2 + (dy - dist * dirY) ^ 2

        -- Bail if outside relative tolerance (more wiggle room for further prisms)
        if crossSq < 1e-6 * math.max(1, dist * dist) then
          if dist < nearestDist then
            nearestDist = dist
            nearest = prism
          end
        end
      end
    end

    if not nearest then
      break
    end

    table.insert(sequence, nearest.id)
    x = nearest.x
    y = nearest.y
    angle = (angle + nearest.angle) % 360
  end

  return sequence
end

return { findSequence = findSequence }
