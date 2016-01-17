local function reduce(xs, value, f)
  for _, x in ipairs(xs) do
    value = f(x, value)
  end
  return value
end

local function map(xs, f)
  return reduce(xs, {}, function(x, acc)
    table.insert(acc, f(x))
    return acc
  end)
end

local function filter(xs, pred)
  return reduce(xs, {}, function(x, acc)
    if pred(x) then table.insert(acc, x) end
    return acc
  end)
end

return {
  map = map,
  reduce = reduce,
  filter = filter
}
