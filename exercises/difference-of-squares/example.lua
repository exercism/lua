local function square_of_sums(n)
  local sum = 0
  for i = 1, n do
    sum = sum + i
  end
  return sum ^ 2
end

local function sum_of_squares(n)
  local sum_of_squares = 0
  for i = 1, n do
    sum_of_squares = sum_of_squares + i ^ 2
  end
  return sum_of_squares
end

local function difference_of_squares(n)
  return square_of_sums(n) - sum_of_squares(n)
end

return {
  square_of_sums = square_of_sums,
  sum_of_squares = sum_of_squares,
  difference_of_squares = difference_of_squares
}
