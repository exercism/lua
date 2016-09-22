local function append(destination, to_append)
  for _, v in ipairs(to_append) do
    table.insert(destination, v)
  end
end

local function flatten(input)
  local flattened = {}
  for i=1, #input do
    local element = input[i]
    if type(element) == 'table' then
      append(flattened, flatten(element))
    else
      table.insert(flattened, element)
    end
  end
  return flattened
end

return flatten
