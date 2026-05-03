local grains = {}

function grains.square(n)
  assert(n >= 1 and n <= 64, 'square must be between 1 and 64')
  return 2 ^ (n - 1)
end

function grains.total()
  return 2 ^ 64 - 1
end

return grains
