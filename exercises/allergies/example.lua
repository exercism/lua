local allergens = {
  'eggs',
  'peanuts',
  'shellfish',
  'strawberries',
  'tomatoes',
  'chocolate',
  'pollen',
  'cats'
}

local function list(score)
  local results = {}
  for i, allergen in ipairs(allergens) do
    if score & 1 << (i - 1) > 0 then
      table.insert(results, allergen)
    end
  end
  return results
end

local function allergic_to(score, which)
  for _, allergen in ipairs(list(score)) do
    if allergen == which then return true end
  end
  return false
end

return {
  list = list,
  allergic_to = allergic_to
}
