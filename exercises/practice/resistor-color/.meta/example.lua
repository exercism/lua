local colors = {
  'black', --
  'brown', --
  'red', --
  'orange', --
  'yellow', --
  'green', --
  'blue', --
  'violet', --
  'grey', --
  'white'
}

return {
  colors = function()
    return colors
  end,

  color_code = function(color)
    for i, v in ipairs(colors) do
      if v == color then
        return i - 1
      end
    end
  end
}
