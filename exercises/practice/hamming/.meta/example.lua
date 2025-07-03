local Hamming = {}

function Hamming.compute(a, b)
  assert(#a == #b, 'strands must be of equal length')
  local distance = 0
  for i = 1, a:len() do
    if (a:sub(i, i) ~= b:sub(i, i)) then
      distance = distance + 1
    end
  end
  return distance
end

return Hamming
