local utils = require 'utils'

local function render_lyrics(lines, terminator)
  local rendered = {}
  for i, line in ipairs(lines) do
    rendered[i] = utils.stringify(line .. (i < #lines and '\n' or terminator))
  end
  return "local expected = '' --\n .. " .. table.concat(rendered, ' --\n .. ')
end

return {
  module_name = 'food_chain',

  generate_test = function(case)
    local first, last = case.input.startVerse, case.input.endVerse

    if first == last then
      local template = [[
        %s
        assert.are.equal(expected, food_chain.verse(%d))]]
      return template:format(render_lyrics(case.expected, '\n'), first)
    end

    local lyrics = render_lyrics(case.expected, '\n\n')

    if case.description == 'full song' then
      local template = [[
        %s
        assert.are.equal(expected, food_chain.sing())]]
      return template:format(lyrics)
    end

    local template = [[
      %s
      assert.are.equal(expected, food_chain.verses(%d, %d))]]
    return template:format(lyrics, first, last)
  end
}
