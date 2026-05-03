local utils = require 'utils'

local function render_song(lines)
  return table.concat(utils.map(lines, function(line)
    return '\'' .. line .. '\''
  end), ',\n')
end

return {
  module_name = 'twelve_days',

  generate_test = function(case)
    local template = [[
      local expected = {
        %s
      }
      assert.are.same(expected, twelve_days.recite(%d, %d))]]
    return template:format(render_song(case.expected), case.input.startVerse, case.input.endVerse)
  end
}
