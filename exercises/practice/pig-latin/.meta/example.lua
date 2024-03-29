local vowel = '[aeiou]'
local consonant = '[^aeiou]'

local function translate(word)
  local function begins_with_any_of(patterns)
    for _, pattern in ipairs(patterns) do
      if word:lower():find('^' .. pattern) then
        return true
      end
    end
  end

  if begins_with_any_of({ vowel, 'yt', 'xr' }) then
    return word .. 'ay'
  elseif begins_with_any_of({ consonant .. 'qu', 'thr', 'sch' }) then
    return word:sub(4) .. word:sub(1, 3) .. 'ay'
  elseif begins_with_any_of({ 'ch', 'qu', 'th', consonant .. consonant .. 'y' }) then
    return word:sub(3) .. word:sub(1, 2) .. 'ay'
  else
    return word:sub(2) .. word:sub(1, 1) .. 'ay'
  end
end

return function(phrase)
  return phrase:gsub('%a+', translate)
end
