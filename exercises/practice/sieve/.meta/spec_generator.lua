local primes_per_line = 20

-- lua-format puts each element of a long table on its own line, so long lists
-- are wrapped by hand and excluded from formatting
local function render_expected(primes)
  if #primes <= primes_per_line then
    return ('local expected = { %s }'):format(table.concat(primes, ', '))
  end

  local lines = {}
  for i = 1, #primes, primes_per_line do
    table.insert(lines, '      ' .. table.concat(primes, ', ', i, math.min(i + primes_per_line - 1, #primes)))
  end

  return table.concat({
    '-- LuaFormatter off',
    '    local expected = {',
    table.concat(lines, ',\n'),
    '    }',
    '    -- LuaFormatter on'
  }, '\n')
end

return {
  module_name = 'sieve',

  test_helpers = [[
    local function primes_from(co)
      local primes = {}
      while true do
        local _, prime = coroutine.resume(co)
        if prime == nil then
          return primes
        end
        table.insert(primes, prime)
      end
    end
  ]],

  generate_test = function(case)
    local template = [[
      %s
      assert.are.same(expected, primes_from(sieve(%d)))]]
    return template:format(render_expected(case.expected), case.input.limit)
  end
}
