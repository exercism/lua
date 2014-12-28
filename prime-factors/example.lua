function PrimeFactors(input) 
  local pf = {}
  local i = 2
  while (input ~=1 ) do
    if (input%i == 0) then
      input = input/i
      table.insert( pf, i )
    else 
      i=i+1
    end
  end
  return pf
end

return PrimeFactors