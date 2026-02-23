local function inverse_char(char)
  return string.char(219 - string.byte(char))
end

local function encode(phrase)
  local clean = string.gsub(string.lower(phrase), "[^a-z0-9]", "")
  local decoded = string.gsub(clean, "[a-z]", inverse_char)
  local spaced = string.gsub(decoded, ".....", "%0 ")
  return string.match(spaced, "^%s*(.-)%s*$") or spaced
end

local function decode(phrase)
  local clean = string.gsub(string.lower(phrase), "[^a-z0-9]", "")
  return string.gsub(clean, "[a-z]", inverse_char)
end

return { encode = encode, decode = decode }
