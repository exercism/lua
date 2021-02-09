return function(n)
  assert(n > 0, 'Only positive numbers are allowed')

  local steps = 0

  while n > 1 do
    if n % 2 == 0 then
      n = n / 2
    else
      n = 3 * n + 1
    end
    steps = steps + 1
  end

  return steps
end
