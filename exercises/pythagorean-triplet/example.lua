local function is_triplet(...)
  local t = table.pack(...)
  table.sort(t)
  return t[1] ^ 2 + t[2] ^ 2 == t[3] ^2
end

local function triplets_with(options)
  local function matching_triplet(a, b, c)
    if is_triplet(a, b, c) then
      return not options.sum or (options.sum == (a + b + c))
    end
  end

  local triplets = {}
  for a = options.min_factor or 1, options.max_factor do
    for b = a + 1, options.max_factor do
      for c = b + 1, options.max_factor do
        if matching_triplet(a, b, c) then
          table.insert(triplets, { a, b, c })
        end
      end
    end
  end
  return triplets
end

return {
  is_triplet = is_triplet,
  triplets_with = triplets_with
}
