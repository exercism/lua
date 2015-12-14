local BankAccount = {}

function BankAccount:balance()
  return self._value
end

function BankAccount:deposit(amount)
  assert(not self._closed)
  assert(amount > 0)
  self._value = self._value + amount
end

function BankAccount:withdraw(amount)
  assert(not self._closed)
  assert(amount > 0)
  assert(self._value - amount > 0)
  self._value = self._value - amount
end

function BankAccount:close(amount)
  self._closed = true
end

function BankAccount:new()
  local o = setmetatable({
    _value = 0
  }, self)
  self.__index = self
  return o
end

return BankAccount
