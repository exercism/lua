return {
  format = function(name, number)
    local suffix = 'th'
    if number // 10 % 10 ~= 1 then
      local last = number % 10
      if last == 1 then
        suffix = 'st'
      end
      if last == 2 then
        suffix = 'nd'
      end
      if last == 3 then
        suffix = 'rd'
      end
    end
    return string.format('%s, you are the %d%s customer we serve today. Thank you!', name, number, suffix)
  end
}
