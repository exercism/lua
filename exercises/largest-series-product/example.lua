local function digit_string_to_array(digit_string)
  local a = {}
  digit_string:gsub('.', function(c)
    assert(tonumber(c))
    table.insert(a, tonumber(c))
  end)
  return a
end

local function series_product(a, first, last)
  local product = 1
  for i = first, last do
    product = product * a[i]
  end
  return product
end

return function(config)
  assert(config.span >= 0)
  assert(config.span <= #config.digits)

  local digits = digit_string_to_array(config.digits)
  local largest

  for i = 1, #digits - config.span + 1 do
    local product = series_product(digits, i, i + config.span - 1)
    largest = math.max(largest or 0, product)
  end

  return largest or 1
end
