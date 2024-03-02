return {
  rotate = function(input, key)
    return input:gsub('.', function(c)
      if c:match('%a') then
        local base = c:match('%l') and 'a' or 'A'
        local offset = c:byte() - base:byte()
        return string.char(base:byte() + (offset + key) % 26)
      end
      return c
    end)
  end
}
