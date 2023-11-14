local Darts = {}

function Darts.score(x, y)
  local distance = math.sqrt(x ^ 2 + y ^ 2)
  if distance <= 1 then
    return 10
  elseif distance <= 5 then
    return 5
  elseif distance <= 10 then
    return 1
  else
    return 0
  end
end

return Darts
