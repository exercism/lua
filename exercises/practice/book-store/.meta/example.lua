local function total(basket)
  local counts = { 0, 0, 0, 0, 0 }
  for _, item in ipairs(basket) do
    counts[item] = counts[item] + 1
  end
  table.sort(counts)

  local groups =
    { counts[5] - counts[4], counts[4] - counts[3], counts[3] - counts[2], counts[2] - counts[1], counts[1] }

  -- Two groups of four are cheaper than a group of five plus a group of three.
  adjustment = math.min(groups[3], groups[5])
  groups[5] = groups[5] - adjustment
  groups[3] = groups[3] - adjustment
  groups[4] = groups[4] + 2 * adjustment

  return 5 * groups[5] * 600 + 4 * groups[4] * 640 + 3 * groups[3] * 720 + 2 * groups[2] * 760 + 1 * groups[1] * 800
end

return { total = total }
