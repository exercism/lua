return {
  encode = function(s)
    local result = ''
    local i = 1
    while i <= #s do
      local c = s:sub(i, i)
      local _, _, run = s:find('(' .. c .. '+)', i)
      result = result .. ((#run > 1) and #run or '') .. c
      i = i + #run
    end
    return result
  end,

  decode = function(s)
    local result = ''
    for length, c in s:gmatch('(%d*)(.)') do
      if length == '' then length = 1 end
      result = result .. c:rep(length)
    end
    return result
  end
}
