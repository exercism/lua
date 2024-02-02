local EliudsEggs = {}

function EliudsEggs.egg_count(number)
  local eggs = 0

  local current = number
  while current ~= 0 do
    if current % 2 ~= 0 then
      eggs = eggs + 1
    end

    current = current // 2
  end

  return eggs
end

return EliudsEggs
