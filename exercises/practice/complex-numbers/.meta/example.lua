local Complex

local function close_to(a, b)
  return math.abs(a - b) < 1e-15
end

local function eq(c1, c2)
  return close_to(c1.r, c2.r) and close_to(c1.i, c2.i)
end

local function add(c1, c2)
  return Complex(c1.r + c2.r, c1.i + c2.i)
end

local function sub(c1, c2)
  return Complex(c1.r - c2.r, c1.i - c2.i)
end

local function mul(c1, c2)
  return Complex(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end

local function div(c1, c2)
  local d = c2.r * c2.r + c2.i * c2.i
  return Complex((c1.r * c2.r + c1.i * c2.i) / d, (c1.i * c2.r - c1.r * c2.i) / d)
end

Complex = function(r, i)
  local c = { r = r, i = i or 0 }

  function c.abs()
    return math.sqrt(c.r * c.r + c.i * c.i)
  end

  function c.conj()
    return Complex(c.r, -c.i)
  end

  function c.exp()
    local e = math.exp(c.r)
    return Complex(e * math.cos(c.i), e * math.sin(c.i))
  end

  return setmetatable(c, { __eq = eq, __add = add, __sub = sub, __mul = mul, __div = div })
end

return Complex
