return {
  module_name = 'wordy',

  generate_test = function(case)
    if type(case.expected) == 'number' then
      local template = [[
        assert.are.same(%s, wordy.answer('%s'))]]
      return template:format(case.expected, case.input.question)
    else
      local template = [[
        assert.has_error(function()
          wordy.answer('%s')
        end, 'Invalid question')]]
      return template:format(case.input.question)
    end
  end
}
