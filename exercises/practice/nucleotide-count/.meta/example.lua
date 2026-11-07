local DNA = {}

function DNA:new(str)
  self.__index = self
  local nc = { A = 0, T = 0, C = 0, G = 0 }
  local n = { 'A', 'T', 'C', 'G' }
  for i = 1, str:len() do
    local c = str:sub(i, i)
    if c ~= 'A' and c ~= 'C' and c ~= 'G' and c ~= 'T' then
      error('Invalid Sequence')
    end
    nc[c] = nc[c] + 1
  end
  return setmetatable({ nucleotideCounts = nc, NUCLEOTIDES = n }, self)
end

return DNA
