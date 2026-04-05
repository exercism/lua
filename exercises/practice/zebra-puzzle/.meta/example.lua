local zebra_puzzle = {}

local function permutations(a)
  local n

  return function()
    if not n then
      n = #a
      return a
    end

    -- Step 1. Find largest j such that a[j] > a[j + 1].
    local j = n - 1
    while j >= 1 and a[j] <= a[j + 1] do
      j = j - 1
    end
    if j < 1 then return nil end

    -- Step 2. Find largest l such that a[j] > a[l], then swap.
    local l = n
    while a[j] <= a[l] do
      l = l - 1
    end
    a[j], a[l] = a[l], a[j]

    -- Step 3. Reverse a[j+1] ... a[n].
    local lo, hi = j + 1, n
    while lo < hi do
      a[lo], a[hi] = a[hi], a[lo]
      lo = lo + 1
      hi = hi - 1
    end

    return a
  end
end

local function index_of(t, val)
  for i, v in ipairs(t) do
    if v == val then return i end
  end
  return nil
end

local function next_to(a, b)
  return math.abs(a - b) == 1
end

local water_drinker, zebra_owner

local function solve()
  for colors in permutations(
    { 'yellow', 'red', 'ivory', 'green', 'blue' }) do
    -- 6. The green house is immediately to the right of the ivory house.
    if index_of(colors, 'green') == index_of(colors, 'ivory') + 1 then
      for drinks in permutations(
        { 'water', 'tea', 'orange juice', 'milk', 'coffee' }) do
        -- 4. Coffee is drunk in the green house.
        -- 9. Milk is drunk in the middle house.
        if index_of(drinks, 'coffee') == index_of(colors, 'green')
            and drinks[3] == 'milk' then
          for hobbies in permutations(
            { 'reading', 'painting', 'football', 'dancing', 'chess' }) do
            -- 8. The person in the yellow house is a painter.
            -- 13. The person who plays football drinks orange juice.
            if index_of(hobbies, 'painting') == index_of(colors, 'yellow')
                and index_of(hobbies, 'football') == index_of(drinks, 'orange juice') then
              for nationalities in permutations(
                { 'Ukrainian', 'Spaniard', 'Norwegian', 'Japanese', 'Englishman' }) do
                -- 10. The Norwegian lives in the first house.
                -- 2. The Englishman lives in the red house.
                -- 15. The Norwegian lives next to the blue house.
                -- 5. The Ukrainian drinks tea.
                -- 14. The Japanese person plays chess.
                if nationalities[1] == 'Norwegian'
                    and index_of(colors, 'red') == index_of(nationalities, 'Englishman')
                    and next_to(index_of(nationalities, 'Norwegian'), index_of(colors, 'blue'))
                    and index_of(drinks, 'tea') == index_of(nationalities, 'Ukrainian')
                    and index_of(hobbies, 'chess') == index_of(nationalities, 'Japanese') then
                  for pets in permutations(
                    { 'zebra', 'snail', 'horse', 'fox', 'dog' }) do
                    -- 3. The Spaniard owns the dog.
                    -- 7. The snail owner likes to go dancing.
                    -- 11. The person who enjoys reading lives in the house next to the person with the fox.
                    -- 12. The painter's house is next to the house with the horse.
                    if index_of(pets, 'dog') == index_of(nationalities, 'Spaniard')
                        and index_of(pets, 'snail') == index_of(hobbies, 'dancing')
                        and next_to(index_of(hobbies, 'reading'), index_of(pets, 'fox'))
                        and next_to(index_of(hobbies, 'painting'), index_of(pets, 'horse')) then
                      return nationalities[index_of(drinks, 'water')],
                             nationalities[index_of(pets, 'zebra')]
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

local function ensure_solved()
  if not water_drinker then
    water_drinker, zebra_owner = solve()
  end
end

function zebra_puzzle.drinks_water()
  ensure_solved()
  return water_drinker
end

function zebra_puzzle.owns_zebra()
  ensure_solved()
  return zebra_owner
end

return zebra_puzzle
