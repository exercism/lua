return function(s, length)
  return coroutine.wrap(function()
    for i = 1, #s - length + 1 do
      coroutine.yield(s:sub(i, i + length - 1))
    end
  end)
end
