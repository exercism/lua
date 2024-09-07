local function answer(question)
  local accumulator

  local remaining = question:gsub('%s*(%D+)%s+([-%d]+)', function(operator, operand)
    operand = assert(tonumber(operand))

    if operator == 'What is' then
      accumulator = operand
    elseif operator == 'plus' then
      accumulator = accumulator + operand
    elseif operator == 'minus' then
      accumulator = accumulator - operand
    elseif operator == 'multiplied by' then
      accumulator = accumulator * operand
    elseif operator == 'divided by' then
      accumulator = accumulator / operand
    else
      error('Invalid question')
    end

    return ''
  end)

  if remaining ~= '?' then
    error('Invalid question')
  end

  return accumulator
end

return { answer = answer }
