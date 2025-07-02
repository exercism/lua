return function(s, length)
  assert(string.len(s) > 0, "series cannot be empty")
  assert(length >= 0, "slice length cannot be negative")
  assert(length > 0, "slice length cannot be zero")
  assert(length <= string.len(s), "slice length cannot be greater than series length")

  return coroutine.wrap(function()
    for i = 1, #s - length + 1 do
      coroutine.yield(s:sub(i, i + length - 1))
    end
  end)
end
