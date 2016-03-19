return function(n)
  return coroutine.create(function()
    local is_prime = {}

    for i = 2, n do
      is_prime[i] = true
    end

    for i = 2, n do
      if is_prime[i] then
        coroutine.yield(i)

        for multiple = i * i, n, i do
          is_prime[multiple] = false
        end
      end
    end
  end)
end
