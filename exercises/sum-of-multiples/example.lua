return function(numbers)
  return {
    to = function(limit)
      local multiples = {}
      local sum = 0

      for candidate = 1, limit - 1 do
        for _, number in ipairs(numbers) do
          if candidate % number == 0 then
            multiples[candidate] = true
          end
        end
      end

      for multiple in pairs(multiples) do
        sum = sum + multiple
      end

      return sum
    end
  }
end
