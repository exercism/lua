local utils = require 'utils'

local function sort_keys(t, cmp)
  local keys = {}
  for k in pairs(t) do
    table.insert(keys, k)
  end
  table.sort(keys, cmp)
  return keys
end

local function render_legacy(legacy)
  local entries = {}
  for _, score in ipairs(sort_keys(legacy, function(a, b)
    return tonumber(a) < tonumber(b)
  end)) do
    local letters = utils.map(legacy[score], function(letter)
      return "'" .. letter .. "'"
    end)
    table.insert(entries, ('[%d] = { %s }'):format(tonumber(score), table.concat(letters, ', ')))
  end
  return '{ ' .. table.concat(entries, ', ') .. ' }'
end

local function render_translated(translated)
  local entries = utils.map(sort_keys(translated), function(letter)
    return (letter .. ' = %d'):format(translated[letter])
  end)
  return '{ ' .. table.concat(entries, ', ') .. ' }'
end

return {
  module_name = 'etl',

  generate_test = function(case)
    local template = [[
      local legacy = %s
      local expected = %s
      assert.same(expected, etl.transform(legacy))]]
    return template:format(render_legacy(case.input.legacy), render_translated(case.expected))
  end
}
