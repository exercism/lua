local function reverse(t)
  local reversed = {}
  for i = #t, 1, -1 do
    table.insert(reversed, t[i])
  end
  return reversed
end

return function(n)
  local handshake = {}
  if n & 1 > 0 then table.insert(handshake, 'wink') end
  if n & 2 > 0 then table.insert(handshake, 'double blink') end
  if n & 4 > 0 then table.insert(handshake, 'close your eyes') end
  if n & 8 > 0 then table.insert(handshake, 'jump') end
  if n & 16 > 0 then handshake = reverse(handshake) end
  return handshake
end
