local lookup = {
  [
    ' _ ' ..
    '| |' ..
    '|_|' ..
    '   '
  ] = '0',
  [
    '   ' ..
    '  |' ..
    '  |' ..
    '   '
  ] = '1',
  [
    ' _ ' ..
    ' _|' ..
    '|_ ' ..
    '   '
  ] = '2',
  [
    ' _ ' ..
    ' _|' ..
    ' _|' ..
    '   '
  ] = '3',
  [
    '   ' ..
    '|_|' ..
    '  |' ..
    '   '
  ] = '4',
  [
    ' _ ' ..
    '|_ ' ..
    ' _|' ..
    '   '
  ] = '5',
  [
    ' _ ' ..
    '|_ ' ..
    '|_|' ..
    '   '
  ] = '6',
  [
    ' _ ' ..
    '  |' ..
    '  |' ..
    '   '
  ] = '7',
  [
    ' _ ' ..
    '|_|' ..
    '|_|' ..
    '   '
  ] = '8',
  [
    ' _ ' ..
    '|_|' ..
    ' _|' ..
    '   '
  ] = '9',
}

local row_pattern = ('[^\n]+\n'):rep(4) .. '*'

local function lines(s)
  local lines = {}
  for line in s:gmatch('[^\n]+') do
    assert(#line % 3 == 0)
    table.insert(lines, line)
  end
  return lines
end

local function parse(row)
  local result = ''
  local lines = lines(row)
  assert(#lines[1] == #lines[2] and
         #lines[2] == #lines[3] and
         #lines[3] == #lines[4])
  for i = 1, #lines[1], 3 do
    local character = ''
    for line = 1, 4 do
      character = character .. lines[line]:sub(i, i + 2)
    end
    result = result .. (lookup[character] or '?')
  end
  return result
end

return {
  convert = function(s)
    local results = {}
    for row in s:gmatch(row_pattern) do
      table.insert(results, parse(row))
    end
    return table.concat(results, ',')
  end
}
