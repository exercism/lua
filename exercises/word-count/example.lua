local function word_count(s)
  local counts = {}
  s = s:gsub("'([%w%d']+)'", "%1")
  for w in s:gmatch('[%w%d\']+') do
    local normalized = w:lower()
    counts[normalized] = (counts[normalized] or 0) + 1
  end
  return counts
end

return {
  word_count = word_count,
}
