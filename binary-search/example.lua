return function(array, target)
  local function aux(start_index, end_index)
    if start_index >= end_index then
      return array[start_index] == target and start_index or -1
    end

    local search_index = math.floor((end_index + start_index) / 2)

    if array[search_index] == target then
      return search_index
    elseif array[search_index] > target then
      return aux(start_index, search_index - 1)
    else
      return aux(search_index + 1, end_index)
    end
  end

  return aux(1, #array)
end
