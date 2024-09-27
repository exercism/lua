local Proverb = {}

function Proverb.recite(strings)
  if #strings == 0 then
    return ''
  end

  local lines = {}
  local template = "For want of a %s the %s was lost.\n"
  for index = 2, #strings do
    table.insert(lines, template:format(strings[index - 1], strings[index]))
  end

  template = "And all for the want of a %s.\n"
  table.insert(lines, template:format(strings[1]))
  return table.concat(lines)
end

return Proverb
