local function keep(xs, pred)
  local acc = {}
  for _, x in ipairs(xs) do
    if pred(x) then
      table.insert(acc, x)
    end
  end
  return acc
end

local function discard(xs, pred)
  return keep(xs, function(x)
    return not pred(x)
  end)
end

return { keep = keep, discard = discard }
