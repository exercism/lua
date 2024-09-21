local M = 26

local function coprime(x, y)
  while y ~= 0 do
    x, y = y, x % y
  end
  return x == 1
end

local function partition(s)
  return s:gsub('.....', '%0 '):gsub(' $', '')
end

local function mmi(x, mod)
  local mmi = 1
  while (x * mmi) % mod ~= 1 do
    mmi = mmi + 1
  end
  return mmi
end

local function encode_char(char, key)
  local x = char:byte() - ('a'):byte()
  return string.char((key.a * x + key.b) % M + ('a'):byte())
end

local function decode_char(char, key)
  local x = char:byte() - ('a'):byte()
  return string.char((mmi(key.a, M) * (x - key.b)) % M + ('a'):byte())
end

local function encode(phrase, key)
  assert(coprime(key.a, M), 'a and m must be coprime.')

  return partition(phrase:gsub('%W', ''):gsub('%a', function(char)
    return encode_char(char:lower(), key)
  end))
end

local function decode(phrase, key)
  assert(coprime(key.a, M), 'a and m must be coprime.')

  return phrase:gsub('%s', ''):gsub('%a', function(char)
    return decode_char(char:lower(), key)
  end)
end

return { encode = encode, decode = decode }
