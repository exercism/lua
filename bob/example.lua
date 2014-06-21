bob = {}

local function shouting(say) 
    return string.upper(say) == say
end

local function nothing(say) 
    return say == nil or string.len(say) == 0
end

local function question(say)
    return string.sub(say, -1) == '?'
end

function bob.hey( say )
  if (nothing(say)) then return 'Fine, be that way.' end
  if (shouting(say)) then return "Woah, chill out!" end
  if (question(say)) then return "Sure" end
  return "Whatever"
end  

return bob