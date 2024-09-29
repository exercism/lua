local function reversed(s)
  local reversed = ''
  for c in s:gmatch('.') do
    reversed = c .. reversed
  end
  return reversed
end

local function is_palindrome(n)
  local s = tostring(n)
  return s == reversed(s)
end

local function validate_inputs(min, max)
  assert(min <= max, 'min must be <= max')
end

local function smallest(min, max)
  validate_inputs(min, max)

  local value = math.huge
  local factors = {}

  for i = min, max do
    for j = i, max do
      local n = i * j

      if n <= value and is_palindrome(n) then
        if n ~= value then
          value = n
          factors = {}
        end
        table.insert(factors, { i, j })
      end
    end
  end

  return { value = #factors > 0 and value or nil, factors = factors }
end

local function largest(min, max)
  validate_inputs(min, max)

  local value = -math.huge
  local factors = {}

  for i = max, min, -1 do
    for j = i, min, -1 do
      local n = i * j

      if n >= value and is_palindrome(n) then
        if n ~= value then
          value = n
          factors = {}
        end
        table.insert(factors, { j, i })
      end
    end
  end

  return { value = #factors > 0 and value or nil, factors = factors }
end

return { smallest = smallest, largest = largest }
