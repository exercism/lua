local function clean(s)
  s = s:gsub('[()-. ]', '')

  assert(not s:match('%D'))
  assert(#s == 10 or #s == 11)
  assert(#s ~= 11 or s:sub(1, 1) == '1')

  s = s:sub(#s - 9)

  local area_code, exchange_code, line_number = s:match('(...)(...)(....)')

  assert(not area_code:match('^[01]'))
  assert(not exchange_code:match('^[01]'))

  return area_code .. exchange_code .. line_number
end

return { clean = clean }
