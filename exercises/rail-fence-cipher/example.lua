local function flatten(tables)
  local flattened = {}
  for _, t in ipairs(tables) do
    for _, v in ipairs(t) do
      table.insert(flattened, v)
    end
  end
  return flattened
end

local function correspondences(length, rail_count)
  local lines = {}
  local line_index = 1
  local delta = 1

  for i = 1, rail_count do lines[i] = {} end

  for i = 1, length do
    table.insert(lines[line_index], i)

    line_index = line_index + delta
    if line_index == rail_count then delta = -1 end
    if line_index == 1 then delta = 1 end
  end

  return ipairs(flatten(lines))
end

local function encode(plaintext, rail_count)
  local ciphertext = {}
  for i, v in correspondences(#plaintext, rail_count) do
    ciphertext[i] = plaintext:sub(v, v)
  end
  return table.concat(ciphertext)
end

local function decode(ciphertext, rail_count)
  local plaintext = {}
  for i, v in correspondences(#ciphertext, rail_count) do
    plaintext[v] = ciphertext:sub(i, i)
  end
  return table.concat(plaintext)
end

return { encode = encode, decode = decode }
