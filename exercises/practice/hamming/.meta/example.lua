local Hamming = {}

function Hamming.compute(a,b)
  if #a ~= #b then return -1 end
  local distance = 0
  for i = 1, a:len() do
    if (a:sub(i, i) ~= b:sub(i, i)) then
      distance = distance + 1
    end
  end
  return distance
end

return Hamming
