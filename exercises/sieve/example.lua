return function(n)
  local candidates = { false }
  local primes = {}

  for i = 2, n do
    candidates[i] = true
  end

  for i = 2, math.sqrt(n) do
    if candidates[i] then
      for multiple = i * 2, n, i do
        candidates[multiple] = false
      end
    end
  end

  for candidate, is_prime in ipairs(candidates) do
    if is_prime then table.insert(primes, candidate) end
  end

  return primes
end
