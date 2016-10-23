local BowlingScorer = require('bowling')

describe('bowling', function()
  local scorer

  before_each(function()
    scorer = BowlingScorer()
  end)

  local function roll_n_times(pins, n)
    for i = 1, n do
      if type(pins) == 'table' then
        for _, pins in ipairs(pins) do scorer.roll(pins) end
      else
        scorer.roll(pins)
      end
    end
  end

  it('should score a game with all gutterballs', function()
    roll_n_times(0, 20)
    assert.equal(0, scorer.score())
  end)

  it('should allow a game with all open frames', function()
    roll_n_times({ 6, 3 }, 10)
    assert.equal(90, scorer.score())
  end)

  it('should score a spare followed by zeros as 10', function()
    scorer.roll(6)
    scorer.roll(4)
    roll_n_times(0, 18)
    assert.equal(10, scorer.score())
  end)

  it('should count points scored in the roll after a spare twice', function()
    scorer.roll(6)
    scorer.roll(4)
    scorer.roll(3)
    roll_n_times(0, 17)
    assert.equal(16, scorer.score())
  end)

  it('should allow a one roll bonus for each consecutive spare', function()
    scorer.roll(5)
    scorer.roll(5)
    scorer.roll(3)
    scorer.roll(7)
    scorer.roll(4)
    roll_n_times(0, 15)
    assert.equal(31, scorer.score())
  end)

  it('should score a fill ball for a spare in the last frame', function()
    roll_n_times(0, 18)
    scorer.roll(7)
    scorer.roll(3)
    scorer.roll(7)
    assert.equal(17, scorer.score())
  end)

  it('should score a strike as 10 points when the next frame earns no points', function()
    scorer.roll(10)
    roll_n_times(0, 18)
    assert.equal(10, scorer.score())
  end)

  it('should score the next two rolls after a strike as double', function()
    scorer.roll(10)
    scorer.roll(5)
    scorer.roll(3)
    roll_n_times(0, 16)
    assert.equal(26, scorer.score())
  end)

  it('should correctly score multiple strikes in a row', function()
    scorer.roll(10)
    scorer.roll(10)
    scorer.roll(10)
    scorer.roll(5)
    scorer.roll(3)
    roll_n_times(0, 12)
    assert.equal(81, scorer.score())
  end)

  it('should allow fill balls when the final frame is a strike', function()
    roll_n_times(0, 18)
    scorer.roll(10)
    scorer.roll(7)
    scorer.roll(1)
    assert.equal(18, scorer.score())
  end)

  it('should not allow a bonus roll after rolling a spare after a strike on the last frame', function()
    roll_n_times(0, 18)
    scorer.roll(10)
    scorer.roll(7)
    scorer.roll(3)
    assert.equal(20, scorer.score())
  end)

  it('should not allow bonus rolls for strikes rolled with fill balls from a strike', function()
    roll_n_times(0, 18)
    roll_n_times(10, 3)
    assert.equal(30, scorer.score())
  end)

  it('should not allow bonus rolls for strikes rolled the fill ball from a spare', function()
    roll_n_times(0, 18)
    scorer.roll(7)
    scorer.roll(3)
    scorer.roll(10)
    assert.equal(20, scorer.score())
  end)

  it('should be able to score a perfect game', function()
    roll_n_times(10, 12)
    assert.equal(300, scorer.score())
  end)

  it('should not allow a roll with negative pins', function()
    assert.has_error(function() scorer.roll(-1) end)
  end)

  it('should not allow a roll better than a strike', function()
    assert.has_error(function() scorer.roll(11) end)
  end)

  it('should not allow two rolls in a frame to exceed 10 pins', function()
    scorer.roll(5)
    assert.has_error(function() scorer.roll(6) end)
  end)

  it('should not allow fill balls after a strike in the final frame to score more than 10 points', function()
    roll_n_times(0, 18)
    scorer.roll(10)
    scorer.roll(5)
    assert.has_error(function() scorer.roll(6) end)
  end)

  it('should not allow the score to be taken at the beginning of the game', function()
    assert.has_error(function() scorer.score() end)
  end)

  it('should not allow the score to be taken before 10 frames have been played', function()
    roll_n_times(0, 19)
    assert.has_error(function() scorer.score() end)
  end)

  it('should not allow more rolls after 10 frames have been played', function()
    roll_n_times(0, 20)
    assert.has_error(function() scorer.roll(0) end)
  end)

  it('should not allow the game to be scored before either fill ball for a strike in the final frame', function()
    roll_n_times(10, 10)
    assert.has_error(function() scorer.score() end)
  end)

  it('should not allow the game to be scored before either both fill balls for a strike in the final frame', function()
    roll_n_times(10, 11)
    assert.has_error(function() scorer.score() end)
  end)

  it('should not allow the game to be scored before either the fill ball for a spare in the final frame', function()
    roll_n_times(0, 18)
    scorer.roll(7)
    scorer.roll(3)
    assert.has_error(function() scorer.score() end)
  end)

  it('should allow multiple independent scorers to be created', function()
    local s1 = BowlingScorer()
    local s2 = BowlingScorer()

    for i = 1, 20 do
      s1.roll(3)
    end

    for i = 1, 20 do
      s2.roll(2)
    end

    assert.equal(60, s1.score())
    assert.equal(40, s2.score())
  end)
end)
