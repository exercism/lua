local function keep(xs, pred)
  acc = {}
  for _, x in ipairs(xs) do
    if pred(x) then table.insert(acc, x) end
  end
  return acc
end

local function discard(xs, pred)
  acc = {}
  for _, x in ipairs(xs) do
    if not pred(x) then table.insert(acc, x) end
  end
  return acc
end

return {
  keep = keep,
  discard = discard
}
