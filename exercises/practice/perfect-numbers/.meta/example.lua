local function aliquot_sum(n)
  local sum = 0
  for i = 1, n - 1 do
    if n % i == 0 then sum = sum + i end
  end
  return sum
end

local function classify(n)
  local sum = aliquot_sum(n)
  if sum < n then return 'deficient' end
  if sum > n then return 'abundant' end
  return 'perfect'
end

return {
  aliquot_sum = aliquot_sum,
  classify = classify
}
