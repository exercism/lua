local function normalized_plaintext(plaintext)
  return plaintext:lower():gsub('%p*%s*', '')
end

local function size(plaintext)
  return math.ceil(math.sqrt(#normalized_plaintext(plaintext)))
end

local function segments(plaintext)
  local normalized_plaintext = normalized_plaintext(plaintext)
  local segment_size = size(plaintext)
  local segments = {}

  while #normalized_plaintext > 0 do
    local segment = normalized_plaintext:sub(1, segment_size)
    while #segment < segment_size do
      segment = segment .. " "
    end
    table.insert(segments, segment)
    normalized_plaintext = normalized_plaintext:sub(segment_size + 1)
  end

  return segments
end

local function normalized_ciphertext(plaintext)
  local segments = segments(plaintext)
  local enciphered = {}

  for i = 1, size(plaintext) do
    local normalized_ciphertext = ''
    for _, segment in ipairs(segments) do
      normalized_ciphertext = normalized_ciphertext .. segment:sub(i, i)
    end
    table.insert(enciphered, normalized_ciphertext)
  end

  return table.concat(enciphered, ' ')
end

return {
  ciphertext = function(plaintext)
    return normalized_ciphertext(plaintext)
  end
}
