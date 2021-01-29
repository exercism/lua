return function(input)
  local prime_factors = {}
  local i = 2
  while input ~= 1 do
    if input % i == 0 then
      input = input / i
      table.insert(prime_factors, i)
    else
      i = i + 1
    end
  end
  return prime_factors
end
