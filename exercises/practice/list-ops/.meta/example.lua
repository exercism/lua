local function append(xs, ys)
  local result = {}
  for _, x in ipairs(xs) do
    table.insert(result, x)
  end
  for _, y in ipairs(ys) do
    table.insert(result, y)
  end
  return result
end

local function concat(...)
  local result = {}
  for _, list in ipairs({ ... }) do
    for _, item in ipairs(list) do
      table.insert(result, item)
    end
  end
  return result
end

local function length(xs)
  local count = 0
  for _ in ipairs(xs) do
    count = count + 1
  end
  return count
end

local function reverse(xs)
  local result = {}
  for i = #xs, 1, -1 do
    table.insert(result, xs[i])
  end
  return result
end

local function foldl(xs, value, f)
  for _, x in ipairs(xs) do
    value = f(value, x)
  end
  return value
end

local function foldr(xs, value, f)
  return foldl(reverse(xs), value, f)
end

local function map(xs, f)
  return foldl(xs, {}, function(acc, x)
    table.insert(acc, f(x))
    return acc
  end)
end

local function filter(xs, pred)
  return foldl(xs, {}, function(acc, x)
    if pred(x) then
      table.insert(acc, x)
    end
    return acc
  end)
end

return {
  append = append,
  concat = concat,
  length = length,
  reverse = reverse,
  map = map,
  foldl = foldl,
  foldr = foldr,
  filter = filter
}
