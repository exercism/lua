return function(array)
  local accessed = {}

  return setmetatable({
    access_count = 0
  }, {
    __index = function(self, i)
      if not accessed[i] then
        self.access_count = self.access_count + 1
        accessed[i] = true
      end
      return array[i]
    end,
    __len = function()
      return #array
    end
  })
end
