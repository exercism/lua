local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:push(v)
  local old_head = self._head
  self._head = { v = v, next = old_head }
  if old_head then old_head.prev = self._head end
  if not self._tail then self._tail = self._head end
end

function LinkedList:pop()
  local v = self._head.v
  self._head = self._head.next
  if not self._head then self._tail = nil end
  return v
end

function LinkedList:unshift(v)
  local old_tail = self._tail
  self._tail = { v = v, prev = old_tail }
  if old_tail then old_tail.next = self._tail end
  if not self._head then self._head = self._tail end
end

function LinkedList:shift()
  local v = self._tail.v
  self._tail = self._tail.prev
  if self._tail then self._tail.next = nil end
  return v
end

function LinkedList:count()
  local count = 0
  local current = self._head
  while current do
    count = count + 1
    current = current.next
  end
  return count
end

function LinkedList:delete(v)
  local current = self._head
  while current do
    if current.v == v then
      if self._head == current then self._head = current.next end
      if self._tail == current then self._tail = current.prev end
      if current.prev then current.prev.next = current.next end
      if current.next then current.next.prev = current.prev end
    end
    current = current.next
  end
end

return function()
  return setmetatable({}, LinkedList)
end
