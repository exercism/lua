local high_scores = require 'high-scores'

describe('high-scores', function()

  local same_values_in_order

  setup(function()
    same_values_in_order = function(a, b)
      if #a ~= #b then
        return false
      end
      
      for i = 1, #a do
        if a[i] ~= b[i] then
          return false
        end
      end

      return true
    end
  end)

  teardown(function()
    same_values_in_order = nil
  end)

  it('Table of scores', function()
    local values = {30, 50, 20, 70}
    local scores = high_scores{values}
    local expected = {30, 50, 20, 70}
    assert.True(same_values_in_order(expected, scores:scores()))
  end)

  it('Latest score', function()
    local values = {100, 0, 90, 30}
    local scores = high_scores{values}
    local expected = 30
    assert.equal(expected, scores:latest())
  end)

  it('Personal best', function()
    local values = {40, 100, 70}
    local scores = high_scores{values}
    local expected = 100
    assert.equal(expected, scores:personal_best())
  end)

  it('Personal top three from a list of scores', function()
    local values = {10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70}
    local scores = high_scores{values}
    local expected = {100, 90, 70}
    assert.True(same_values_in_order(expected, scores:personal_top_three()))
  end)

  it('Personal top highest to lowest', function()
    local values = {20, 10, 30}
    local scores = high_scores{values}
    local expected = {30, 20, 10}
    assert.True(same_values_in_order(expected, scores:personal_top_three()))
  end)

  it('Personal top when there is a tie', function()
    local values = {40, 20, 40, 30}
    local scores = high_scores{values}
    local expected = {40, 40, 30}
    assert.True(same_values_in_order(expected, scores:personal_top_three()))
  end)

  it('Personal top when there are less than 3', function()
    local values = {30, 70}
    local scores = high_scores{values}
    local expected = {70, 30}
    assert.True(same_values_in_order(expected, scores:personal_top_three()))
  end)

  it('Personal top when there is only one', function()
    local values = {40}
    local scores = high_scores{values}
    local expected = {40}
    assert.True(same_values_in_order(expected, scores:personal_top_three()))
  end)

  it('Latest score after personal top scores', function()
    local values = {70, 50, 20, 30}
    local scores = high_scores{values}
    local _ = scores:personal_top_three()
    local expected = 30
    assert.equal(expected, scores:latest())
  end)

  it('Scores after personal top scores', function()
    local values = {30, 50, 20, 70}
    local scores = high_scores{values}
    local _ = scores:personal_top_three()
    local expected = {30, 50, 20, 70}
    assert.True(same_values_in_order(expected, scores:scores()))
  end)

  it('Latest score after personal best', function()
    local values = {20, 70, 15, 25, 30}
    local scores = high_scores{values}
    local _ = scores:personal_best()
    local expected = 30
    assert.equal(expected, scores:latest())
  end)

  it('Scores after personal best', function()
    local values = {20, 70, 15, 25, 30}
    local scores = high_scores{values}
    local _ = scores:personal_best()
    local expected = {20, 70, 15, 25, 30}
    assert.True(same_values_in_order(expected, scores:scores()))
  end)

end)
