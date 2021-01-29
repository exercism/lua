local combinations

local function generate_combinations(a, n, offset)
  if n > (#a - offset) then
    return
  end

  if n == 0 then
    coroutine.yield({})
    return
  end

  for v in combinations(a, n - 1, offset + 1) do
    table.insert(v, 1, a[1 + offset])
    coroutine.yield(v)
  end

  for v in combinations(a, n, offset + 1) do
    coroutine.yield(v)
  end
end

function combinations(a, n, offset)
  return coroutine.wrap(function() generate_combinations(a, n, offset or 0) end)
end

local function generate_permutations(a, n)
  if n == 0 then
    coroutine.yield(a)
  else
    for i = 1, n do
      a[n], a[i] = a[i], a[n]
      generate_permutations(a, n - 1)
      a[n], a[i] = a[i], a[n]
    end
  end
end

local function permutations(a)
  return coroutine.wrap(function () generate_permutations(a, #a) end)
end

local function unique_letters(s)
  local letter_set = {}
  s:gsub('%a', function(l)
    letter_set[l] = true
  end)

  local letters = {}
  for l in pairs(letter_set) do
    table.insert(letters, l)
  end

  return letters
end

local function populate_letter_map(letter_map, letters, values)
  for i = 1, #letters do
    letter_map[letters[i]] = values[i]
  end
end

local function evaluates_true(solution)
  return load('return ' .. solution)()
end

local function has_no_leading_zeros(solution)
  return not (solution:find('^0%d+') or solution:find('%D0%d+'))
end

local function solve(puzzle)
  local letters = unique_letters(puzzle)
  local letter_map = {}

  for c in combinations({ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }, #letters) do
    for p in permutations(c) do
      populate_letter_map(letter_map, letters, p)
      local solution = puzzle:gsub('%a', letter_map)
      if evaluates_true(solution) and has_no_leading_zeros(solution) then
        return letter_map
      end
    end
  end
end

return {
  solve = solve
}
