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
    table.insert(segments, normalized_plaintext:sub(1, segment_size))
    normalized_plaintext = normalized_plaintext:sub(segment_size + 1)
  end

  return segments
end

local function normalized_ciphertext(plaintext)
  local normalized_ciphertext = ''
  local segments = segments(plaintext)

  for i = 1, size(plaintext) do
    for _, segment in ipairs(segments) do
      normalized_ciphertext = normalized_ciphertext .. segment:sub(i, i)
    end

    normalized_ciphertext = normalized_ciphertext .. ' '
  end

  return normalized_ciphertext:gsub('%s+$', '')
end

local function ciphertext(plaintext)
  return normalized_ciphertext(plaintext):gsub('%s', '')
end

return {
  normalized_plaintext = normalized_plaintext,
  size = size,
  segments = segments,
  ciphertext = ciphertext,
  normalized_ciphertext = normalized_ciphertext
}
