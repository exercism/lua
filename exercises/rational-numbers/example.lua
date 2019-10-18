local function gcd(a, b)
  if b == 0 then
    return math.abs(a)
  else
    return gcd(b, a % b)
  end
end

local function normalize_sign(a)
  if a[2] < 0 then
    return { -a[1], -a[2] }
  else
    return a
  end
end

local function reduce(a)
  a = normalize_sign(a)

  if a[1] == 0 then
    return { 0, 1 }
  end

  local gcd = gcd(a[1], a[2])

  return { a[1] / gcd, a[2] / gcd }
end

local function add(a, b)
  return reduce({ a[1] * b[2] + a[2] * b[1], a[2] * b[2] })
end

local function subtract(a, b)
  return reduce({ a[1] * b[2] - a[2] * b[1], a[2] * b[2] })
end

local function multiply(a, b)
  return reduce({ a[1] * b[1], a[2] * b[2] })
end

local function divide(a, b)
  return multiply(a, { b[2], b[1] })
end

local function abs(a)
  return reduce({ math.abs(a[1]), math.abs(a[2]) })
end

local function exp_rational(a, p)
  return reduce({ a[1] ^ p, a[2] ^ p })
end

local function exp_real(p, a)
  return p ^ (a[1] / a[2])
end

return {
  add = add,
  subtract = subtract,
  multiply = multiply,
  divide = divide,
  abs = abs,
  exp_rational = exp_rational,
  exp_real = exp_real,
  reduce = reduce
}
