local function count_words(s)
  local counts = {}
  for w in s:gmatch('[%w%d\']+') do
    local w = w:lower():gsub("^'", ''):gsub("'$", '')
    if #w > 0 then
      counts[w] = (counts[w] or 0) + 1
    end
  end
  return counts
end

return { count_words = count_words }
