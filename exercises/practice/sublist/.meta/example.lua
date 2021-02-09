return function(sublist, list)
  if #sublist == 0 then return true end

  for i = 1, #list - #sublist + 1 do
    for j = 1, #sublist do
      if list[i + j - 1] ~= sublist[j] then break end
      if j == #sublist then return true end
    end
  end

  return false
end
