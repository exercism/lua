local bob = {}

local function shouting(say)
  return string.upper(say) == say and string.lower(say) ~= say
end

local function nothing(say)
  return not say:match("%w")
end

local function question(say)
  return string.sub(say, -1) == '?'
end

function bob.hey(say)
  say = say:gsub("%s+", "")
  if shouting(say) and question(say) then
    return 'Calm down, I know what I\'m doing!'
  end
  if shouting(say) then
    return "Whoa, chill out!"
  end
  if question(say) then
    return "Sure."
  end
  if nothing(say) then
    return 'Fine. Be that way!'
  end
  return "Whatever."
end

return bob
