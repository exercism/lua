local BankAccount = {}

function BankAccount:open()
  assert(not self._open)
  self._open = true
  self._balance = 0
end

function BankAccount:balance()
  assert(self._open)
  return self._balance
end

function BankAccount:deposit(amount)
  assert(self._open)
  assert(amount > 0)
  self._balance = self._balance + amount
end

function BankAccount:withdraw(amount)
  assert(self._open)
  assert(amount > 0)
  assert(self._balance - amount >= 0)
  self._balance = self._balance - amount
end

function BankAccount:close(amount)
  assert(self._open)
  self._open = false
end

function BankAccount:new()
  local o = setmetatable({ _balance = 0, _open = false }, self)
  self.__index = self
  return o
end

return BankAccount
