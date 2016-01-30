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

  it('should not allow a roll with negative pins', function()
    assert.has_error(function() scorer.roll(-1) end)
  end)

  it('should not allow a roll better than a strike', function()
    assert.has_error(function() scorer.roll(11) end)
  end)

  it('should score a game with all gutterballs', function()
    roll_n_times(0, 20)
    assert.equal(0, scorer.score())
  end)

  it('should score a game with all single pin rolls', function()
    roll_n_times(1, 20)
    assert.equal(20, scorer.score())
  end)

  it('should allow a game with all open frames', function()
    roll_n_times({ 6, 3 }, 10)
    assert.equal(90, scorer.score())
  end)

  it('should correctly score a strike that is not on the last frame', function()
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

  it('should allow fill balls to be strikes when the final frame is a strike', function()
    roll_n_times(0, 18)
    scorer.roll(10)
    scorer.roll(10)
    scorer.roll(10)
    assert.equal(30, scorer.score())
  end)

  it('should not allow the game to be scored before fill balls have been played', function()
    roll_n_times(10, 10)
    assert.has_error(function() scorer.score() end)
  end)

  it('should be able to score a perfect game', function()
    roll_n_times(10, 12)
    assert.equal(300, scorer.score())
  end)

  it('should correctly score a spare that is not on the last frame', function()
    scorer.roll(5)
    scorer.roll(5)
    scorer.roll(3)
    scorer.roll(4)
    roll_n_times(0, 16)
    assert.equal(20, scorer.score())
  end)

  it('should correctly score multiple spares in a row', function()
    scorer.roll(5)
    scorer.roll(5)
    scorer.roll(3)
    scorer.roll(7)
    scorer.roll(4)
    scorer.roll(1)
    roll_n_times(0, 14)
    assert.equal(32, scorer.score())
  end)

  it('should allow a fill ball to be rolled if the last frame is a spare', function()
    roll_n_times(0, 18)
    scorer.roll(9)
    scorer.roll(1)
    scorer.roll(7)
    assert.equal(17, scorer.score())
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
