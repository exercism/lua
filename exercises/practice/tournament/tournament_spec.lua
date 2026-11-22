local tournament = require('tournament')

describe('tournament', function()
  it('just the header if no input', function()
    local rows = {}
    local expected = { 'Team                           | MP |  W |  D |  L |  P' }
    assert.are.same(expected, tournament(rows))
  end)

  it('a win is three points, a loss is zero points', function()
    local rows = { 'Allegoric Alaskans;Blithering Badgers;win' }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3',
      'Blithering Badgers             |  1 |  0 |  0 |  1 |  0'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('a win can also be expressed as a loss', function()
    local rows = { 'Blithering Badgers;Allegoric Alaskans;loss' }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3',
      'Blithering Badgers             |  1 |  0 |  0 |  1 |  0'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('a different team can win', function()
    local rows = { 'Blithering Badgers;Allegoric Alaskans;win' }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Blithering Badgers             |  1 |  1 |  0 |  0 |  3',
      'Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('a draw is one point each', function()
    local rows = { 'Allegoric Alaskans;Blithering Badgers;draw' }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1',
      'Blithering Badgers             |  1 |  0 |  1 |  0 |  1'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('there can be more than one match', function()
    local rows = { 'Allegoric Alaskans;Blithering Badgers;win', 'Allegoric Alaskans;Blithering Badgers;win' }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6',
      'Blithering Badgers             |  2 |  0 |  0 |  2 |  0'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('there can be more than one winner', function()
    local rows = { 'Allegoric Alaskans;Blithering Badgers;loss', 'Allegoric Alaskans;Blithering Badgers;win' }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3',
      'Blithering Badgers             |  2 |  1 |  0 |  1 |  3'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('there can be more than two teams', function()
    local rows = {
      'Allegoric Alaskans;Blithering Badgers;win',
      'Blithering Badgers;Courageous Californians;win',
      'Courageous Californians;Allegoric Alaskans;loss'
    }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6',
      'Blithering Badgers             |  2 |  1 |  0 |  1 |  3',
      'Courageous Californians        |  2 |  0 |  0 |  2 |  0'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('typical input', function()
    local rows = {
      'Allegoric Alaskans;Blithering Badgers;win',
      'Devastating Donkeys;Courageous Californians;draw',
      'Devastating Donkeys;Allegoric Alaskans;win',
      'Courageous Californians;Blithering Badgers;loss',
      'Blithering Badgers;Devastating Donkeys;loss',
      'Allegoric Alaskans;Courageous Californians;win'
    }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Devastating Donkeys            |  3 |  2 |  1 |  0 |  7',
      'Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6',
      'Blithering Badgers             |  3 |  1 |  0 |  2 |  3',
      'Courageous Californians        |  3 |  0 |  1 |  2 |  1'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('incomplete competition (not all pairs have played)', function()
    local rows = {
      'Allegoric Alaskans;Blithering Badgers;loss',
      'Devastating Donkeys;Allegoric Alaskans;loss',
      'Courageous Californians;Blithering Badgers;draw',
      'Allegoric Alaskans;Courageous Californians;win'
    }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6',
      'Blithering Badgers             |  2 |  1 |  1 |  0 |  4',
      'Courageous Californians        |  2 |  0 |  1 |  1 |  1',
      'Devastating Donkeys            |  1 |  0 |  0 |  1 |  0'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('ties broken alphabetically', function()
    local rows = {
      'Courageous Californians;Devastating Donkeys;win',
      'Allegoric Alaskans;Blithering Badgers;win',
      'Devastating Donkeys;Allegoric Alaskans;loss',
      'Courageous Californians;Blithering Badgers;win',
      'Blithering Badgers;Devastating Donkeys;draw',
      'Allegoric Alaskans;Courageous Californians;draw'
    }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7',
      'Courageous Californians        |  3 |  2 |  1 |  0 |  7',
      'Blithering Badgers             |  3 |  0 |  1 |  2 |  1',
      'Devastating Donkeys            |  3 |  0 |  1 |  2 |  1'
    }
    assert.are.same(expected, tournament(rows))
  end)

  it('ensure points sorted numerically', function()
    local rows = {
      'Devastating Donkeys;Blithering Badgers;win',
      'Devastating Donkeys;Blithering Badgers;win',
      'Devastating Donkeys;Blithering Badgers;win',
      'Devastating Donkeys;Blithering Badgers;win',
      'Blithering Badgers;Devastating Donkeys;win'
    }
    local expected = {
      'Team                           | MP |  W |  D |  L |  P',
      'Devastating Donkeys            |  5 |  4 |  0 |  1 | 12',
      'Blithering Badgers             |  5 |  1 |  0 |  4 |  3'
    }
    assert.are.same(expected, tournament(rows))
  end)
end)
