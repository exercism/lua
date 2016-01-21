local alphabet = 'abcdefghijklmnopqrstuvwxyz'
local decoder_ring = setmetatable({}, { __index = function() return '' end })

for i = 1, #alphabet do
  decoder_ring[alphabet:sub(i, i)] = alphabet:reverse():sub(i, i)
end

for i = 0, 9 do
  decoder_ring[tostring(i)] = tostring(i)
end

local function transcribe(plaintext)
  return plaintext:lower():gsub('.', decoder_ring)
end

local function split_chunks(s)
  local chunks = {}
  s:gsub('..?.?.?.?', function(chunk)
    table.insert(chunks, chunk)
  end)
  return table.concat(chunks, ' ')
end

return {
  encode = function(plaintext)
    return split_chunks(transcribe(plaintext))
  end
}
