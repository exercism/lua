local BinarySearchTree = {}
BinarySearchTree.__index = BinarySearchTree

function BinarySearchTree:new(value)
  return setmetatable({
    value = value
  }, self)
end

function BinarySearchTree:from_list(list)
  assert(#list > 0)
  local tree = BinarySearchTree:new(list[1])
  for i = 2, #list do
    tree:insert(list[i])
  end
  return tree
end

function BinarySearchTree:values()
  return coroutine.wrap(function()
    if self.left then
      for v in self.left:values() do coroutine.yield(v) end
    end
    coroutine.yield(self.value)
    if self.right then
      for v in self.right:values() do coroutine.yield(v) end
    end
  end)
end

function BinarySearchTree:insert(value)
  local side = value > self.value and 'right' or 'left'
  if self[side] then
    self[side]:insert(value)
  else
    self[side] = BinarySearchTree:new(value)
  end
  return self
end

return BinarySearchTree
