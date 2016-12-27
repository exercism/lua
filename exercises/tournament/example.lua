local function pad_right(s, width)
  return s .. (' '):rep(width - #s)
end

local function parse(results)
  local stats = {}

  for _, result in ipairs(results) do
    local t1, t2, outcome = result:match('^([^;]+);([^;]+);([^;]+)$')

    if t1 and t2 and outcome then
      stats[t1] = stats[t1] or { w = 0, l = 0, d = 0 }
      stats[t2] = stats[t2] or { w = 0, l = 0, d = 0 }

      if outcome == 'win' then
        stats[t1].w = stats[t1].w + 1
        stats[t2].l = stats[t2].l + 1
      elseif outcome == 'loss' then
        stats[t1].l = stats[t1].l + 1
        stats[t2].w = stats[t2].w + 1
      elseif outcome == 'draw' then
        stats[t1].d = stats[t1].d + 1
        stats[t2].d = stats[t2].d + 1
      end
    end
  end

  return stats
end

local function finalize(stats)
  for _, team_stats in pairs(stats) do
    team_stats.mp = team_stats.w + team_stats.l + team_stats.d
    team_stats.p = team_stats.w * 3 + team_stats.d
  end
end

local function sorted_stats(stats)
  local sorted = {}

  for name, stats in pairs(stats) do
    table.insert(sorted, { name = name, stats = stats })
  end

  table.sort(sorted, function(x, y)
    if x.stats.p == y.stats.p then
      return x.name < y.name
    else
      return x.stats.p > y.stats.p
    end
  end)

  return sorted
end

local function format(stats)
  local sorted = sorted_stats(stats)
  local formatted = {}

  table.insert(formatted, pad_right('Team', 31) .. '| MP |  W |  D |  L |  P')
  for _, b in ipairs(sorted) do
    table.insert(formatted, string.format(
      '%s| %2d | %2d | %2d | %2d | %2d',
      pad_right(b.name, 31),
      b.stats.mp,
      b.stats.w,
      b.stats.d,
      b.stats.l,
      b.stats.p
    ))
  end

  return formatted
end

return function(results)
  local stats = parse(results)
  finalize(stats)
  return format(stats)
end
