local function numbered_lines(file)
  return coroutine.wrap(function()
    local line_number = 1
    for line in io.lines(file) do
      coroutine.yield(line_number, line)
      line_number = line_number + 1
    end
  end)
end

local function line_matches(line, pattern, flags)
  if flags['-i'] then
    line = line:lower()
    pattern = pattern:lower()
  end

  local line_matches
  do
    if flags['-x'] then
      line_matches = line == pattern
    else
      line_matches = line:match(pattern, 1, true)
    end
  end

  if flags['-v'] then
    return not line_matches
  else
    return line_matches
  end
end

local function set_from_array(t)
  local set = {}
  for _, v in ipairs(t) do
    set[v] = true
  end
  return set
end

return function(options)
  local matches = {}
  local flags = set_from_array(options.flags)
  local files = options.files
  local pattern = options.pattern

  for _, file in ipairs(files) do
    for line_number, line in numbered_lines(file) do
      if line_matches(line, pattern, flags) then
        if flags['-l'] then
          table.insert(matches, file)
          break
        else
          local prefix = ('%s%s'):format(#files > 1 and file .. ':' or '',
                                         flags['-n'] and tostring(line_number) .. ':' or '')
          table.insert(matches, prefix .. line)
        end
      end
    end
  end

  return matches
end
