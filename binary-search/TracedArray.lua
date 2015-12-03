return function(array)
  return setmetatable({
    access_count = 0
  }, {
    __index = function(self, i)
      self.access_count = self.access_count + 1
      return array[i]
    end,
    __len = function()
      return #array
    end
  })
end
