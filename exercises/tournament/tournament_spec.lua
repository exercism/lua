local tournament = require 'tournament'

describe('tournament', function()
  it('should generate standings for a complete competition', function()
    local results = {
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

    assert.are.same(expected, tournament(results))
  end)

  it('should generate standings for an incomplete competition', function()
    local results = {
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

    assert.are.same(expected, tournament(results))
  end)

  it('should break any ties alphabetically', function()
    local results = {
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

    assert.are.same(expected, tournament(results))
  end)

  it('should ignore blank lines', function()
    local results = {
      'Allegoric Alaskans;Blithering Badgers;win',
      '',
      'Devastating Donkeys;Courageous Californians;draw',
      'Devastating Donkeys@Courageous Californians;draw',
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

    assert.are.same(expected, tournament(results))
  end)

  it('should ignore lines with invalid separators', function()
    local results = {
      'Allegoric Alaskans;Blithering Badgers;win',
      'Devastating Donkeys;Courageous Californians;draw',
      'Devastating Donkeys@Courageous Californians;draw',
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

    assert.are.same(expected, tournament(results))
  end)

  it('should ignore lines with too many separators', function()
    local results = {
      'Allegoric Alaskans;Blithering Badgers;win',
      'Devastating Donkeys;Courageous Californians;draw',
      'Devastating Donkeys;Courageous Californians;draw;5',
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

    assert.are.same(expected, tournament(results))
  end)

  it('should ignore lines with invalid match results', function()
    local results = {
      'Allegoric Alaskans;Blithering Badgers;win',
      'Devastating Donkeys;Courageous Californians;draw',
      'Devastating Donkeys;Allegoric Alaskans;dra',
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

    assert.are.same(expected, tournament(results))
  end)
end)
