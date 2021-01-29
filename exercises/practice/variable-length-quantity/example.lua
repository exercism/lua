local function decode(bytes)
  local values = {}
  local n = 0
  for i, byte in ipairs(bytes) do
    n = n << 7
    n = n + (byte & 0x7f)
    if byte & 0x80 == 0 then
      table.insert(values, n)
      n = 0
    end
    assert((i ~= #bytes) or (byte & 0x80 == 0), 'incomplete byte sequence')
  end
  return values
end

local function encode_single(n)
  local bytes = { n & 0x7f }
  n = n >> 7
  while n > 0 do
    table.insert(bytes, 1, n & 0x7f | 0x80)
    n = n >> 7
  end
  return bytes
end

local function encode(values)
  local bytes = {}
  for _, value in ipairs(values) do
    for _, byte in ipairs(encode_single(value)) do
      table.insert(bytes, byte)
    end
  end
  return bytes
end

return { decode = decode, encode = encode }
