return function(n)
  assert(n > 0, 'n must be positive')

  local primes = {}

  local function is_prime(n)
    for _, p in ipairs(primes) do
      if n % p == 0 then return false end
      if p^2 > n then return true end
    end
    return true
  end

  for i = 2, math.huge do
    if is_prime(i) then table.insert(primes, i) end
    if #primes == n then return primes[#primes] end
  end
end
