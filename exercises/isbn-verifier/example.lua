return {
  valid = function(isbn)
    isbn = isbn:gsub('-', '')

    if not isbn:match('^%d%d%d%d%d%d%d%d%d[%dX]$') then
      return false
    end

    local sum = 0
    for i = 1, 10 do
      sum = sum + (11 - i) * (tonumber(isbn:sub(i, i)) or 10)
    end

    return sum % 11 == 0
  end
}
