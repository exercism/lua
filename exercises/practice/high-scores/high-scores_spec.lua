local HighScores = require 'high-scores'

describe('high-scores', function()
  it('table of scores', function()
    local values = { 30, 50, 20, 70 }
    local scores = HighScores(values)
    local expected = { 30, 50, 20, 70 }
    assert.are.same(expected, scores:scores())
  end)

  it('latest score', function()
    local values = { 100, 0, 90, 30 }
    local scores = HighScores(values)
    local expected = 30
    assert.equal(expected, scores:latest())
  end)

  it('personal best', function()
    local values = { 40, 100, 70 }
    local scores = HighScores(values)
    local expected = 100
    assert.equal(expected, scores:personal_best())
  end)

  it('personal top three from a list of scores', function()
    local values = { 10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70 }
    local scores = HighScores(values)
    local expected = { 100, 90, 70 }
    assert.are.same(expected, scores:personal_top_three())
  end)

  it('personal top highest to lowest', function()
    local values = { 20, 10, 30 }
    local scores = HighScores(values)
    local expected = { 30, 20, 10 }
    assert.are.same(expected, scores:personal_top_three())
  end)

  it('personal top when there is a tie', function()
    local values = { 40, 20, 40, 30 }
    local scores = HighScores(values)
    local expected = { 40, 40, 30 }
    assert.are.same(expected, scores:personal_top_three())
  end)

  it('personal top when there are less than 3', function()
    local values = { 30, 70 }
    local scores = HighScores(values)
    local expected = { 70, 30 }
    assert.are.same(expected, scores:personal_top_three())
  end)

  it('personal top when there is only one', function()
    local values = { 40 }
    local scores = HighScores(values)
    local expected = { 40 }
    assert.are.same(expected, scores:personal_top_three())
  end)

  it('latest score after personal top scores', function()
    local values = { 70, 50, 20, 30 }
    local scores = HighScores(values)
    local _ = scores:personal_top_three()
    local expected = 30
    assert.equal(expected, scores:latest())
  end)

  it('scores after personal top scores', function()
    local values = { 30, 50, 20, 70 }
    local scores = HighScores(values)
    local _ = scores:personal_top_three()
    local expected = { 30, 50, 20, 70 }
    assert.are.same(expected, scores:scores())
  end)

  it('latest score after personal best', function()
    local values = { 20, 70, 15, 25, 30 }
    local scores = HighScores(values)
    local _ = scores:personal_best()
    local expected = 30
    assert.equal(expected, scores:latest())
  end)

  it('scores after personal best', function()
    local values = { 20, 70, 15, 25, 30 }
    local scores = HighScores(values)
    local _ = scores:personal_best()
    local expected = { 20, 70, 15, 25, 30 }
    assert.are.same(expected, scores:scores())
  end)
end)
