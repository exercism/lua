local function is_sublist(l1, l2)
  if #l1 == 0 then
    return true
  end

  for i = 1, #l2 - #l1 + 1 do
    for j = 1, #l1 do
      if l2[i + j - 1] ~= l1[j] then
        break
      end
      if j == #l1 then
        return true
      end
    end
  end

  return false
end

return function(l1, l2)
  local l1_sublist = is_sublist(l1, l2)
  local l2_sublist = is_sublist(l2, l1)

  if l1_sublist and l2_sublist then
    return 'equal'
  elseif l1_sublist then
    return 'sublist'
  elseif l2_sublist then
    return 'superlist'
  else
    return 'unequal'
  end
end
