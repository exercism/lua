local function eval_definition(definition, user_words)
  for name, body in definition:gmatch(': (%S+)%s+(.+)') do
    assert(not tonumber(name))
    user_words[name:lower()] = body:gsub('%S+', function(s)
      return user_words[s] or s
    end)
  end
end

local function pop(stack)
  assert(#stack > 0)
  return table.remove(stack)
end

local function push(stack, element)
  assert(element ~= nil)
  table.insert(stack, element)
end

local function eval_code(code, stack, user_words)
  for element in code:lower():gmatch('%S+') do
    if user_words[element] then
      eval_code(user_words[element], stack, user_words)
    else
      if element == '+' then
        push(stack, pop(stack) + pop(stack))
      elseif element == '-' then
        push(stack, -pop(stack) + pop(stack))
      elseif element == '*' then
        push(stack, pop(stack) * pop(stack))
      elseif element == '/' then
        local divisor = pop(stack)
        local dividend = pop(stack)
        assert(divisor ~= 0)
        push(stack, dividend // divisor)
      elseif element == 'dup' then
        push(stack, stack[#stack])
      elseif element == 'drop' then
        pop(stack)
      elseif element == 'swap' then
        local e1, e2 = pop(stack), pop(stack)
        push(stack, e1)
        push(stack, e2)
      elseif element == 'over' then
        push(stack, stack[#stack - 1])
      else
        push(stack, tonumber(element))
      end
    end
  end
end

local function eval_chunk(chunk, stack, user_words)
  if chunk:sub(1, 1) == ':' then
    eval_definition(chunk, user_words)
  else
    eval_code(chunk, stack, user_words)
  end
end

local function evaluate(s)
  local stack = {}
  local user_words = {}
  for chunk in s:gmatch('[^;]+') do
    eval_chunk(chunk, stack, user_words)
  end
  return stack
end

return { evaluate = evaluate }
