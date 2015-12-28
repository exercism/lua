local opening_bracket = {
  ['('] = true,
  ['['] = true,
  ['{'] = true
}

local closing_bracket = {
  [')'] = '(',
  [']'] = '[',
  ['}'] = '{'
}

return {
  valid = function(s)
    local history = {}

    for c in s:gmatch('.') do
      if opening_bracket[c] then
        table.insert(history, c)
      elseif closing_bracket[c] then
        if history[#history] ~= closing_bracket[c] then return false end
        table.remove(history, #history)
      end
    end

    return #history == 0
  end
}
