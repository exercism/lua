return function(sum)
  local function from_a(x)
    -- Given that:
    -- (1) a + b + c = p
    -- (2) a ^ 2 + b ^ 2 = c ^ 2
    -- (2) c = sqrt(a ^ 2 + b ^ 2)
    --
    -- (2) -> (1) a + b + sqrt(a ^ 2 + b ^ 2) = p
    --
    -- Rearranging we get:
    -- b = 0.5 * (p - (pa / (p - a)))

    return (sum - sum * x / (sum - x)) / 2
  end

  local triplets = {}

  for a=1, sum do
    local b = from_a(a)

    if a > b then
      break
    end

    local frac
    b, frac = math.modf(b)
    if frac == 0.0 then
      -- Mathematically from_a might yield non-natural numbers which are then
      -- truncated by integer division, so here we filter only for integer
      -- triplets.
      table.insert(triplets, { a, b, sum - (a + b) })
    end
  end

  return triplets
end
