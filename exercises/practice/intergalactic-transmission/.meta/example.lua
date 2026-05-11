local function read_bit(bytes, index)
  local byte_index = math.ceil(index / 8)
  local bit_index = (index - 1) % 8
  if byte_index > #bytes then
    return nil
  end
  return (bytes[byte_index] >> (7 - bit_index)) & 1
end

local function bit_chunks(bytes, chunk_size)
  return coroutine.wrap(function()
    for i = 1, #bytes * 8, chunk_size do
      local chunk = 0
      for j = 0, chunk_size - 1 do
        local bit = read_bit(bytes, i + j)
        chunk = (chunk << 1) | (bit or 0)
      end
      coroutine.yield(chunk)
    end
  end)
end

local function popcount(byte)
  local count = 0
  while byte > 0 do
    count = count + byte & 1
    byte = byte >> 1
  end
  return count
end

local function transmit_sequence(sequence)
  local result = {}
  for chunk in bit_chunks(sequence, 7) do
    table.insert(result, (chunk << 1) | popcount(chunk) % 2)
  end
  return result
end

local function decode_message(message)
  local result = {}
  local accumulator = 0
  local accumulator_count = 0

  for _, byte in ipairs(message) do
    assert(popcount(byte) % 2 == 0, 'wrong parity')

    for i = 7, 1, -1 do
      local bit = (byte >> i) & 1
      accumulator = (accumulator << 1) | bit
      accumulator_count = accumulator_count + 1

      if accumulator_count == 8 then
        table.insert(result, accumulator)
        accumulator = 0
        accumulator_count = 0
      end
    end
  end

  return result
end

return { transmit_sequence = transmit_sequence, decode_message = decode_message }
