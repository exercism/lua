local HighScores = {}

function HighScores:scores()

end

function HighScores:latest()

end

function HighScores:personal_best()

end

function HighScores:personal_top_three()

end

return function(scores)
  local high_scores = {}
  setmetatable(high_scores, { __index = HighScores })

  -- TODO: store the scores in the high_scores object

  return high_scores
end
