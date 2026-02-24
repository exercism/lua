local camicia = require('camicia')

describe('camicia', function()
  it('two cards, one trick', function()
    local playerA = { '2' }
    local playerB = { '3' }
    local expected = { status = 'finished', tricks = 1, cards = 2 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('three cards, one trick', function()
    local playerA = { '2', '4' }
    local playerB = { '3' }
    local expected = { status = 'finished', tricks = 1, cards = 3 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('four cards, one trick', function()
    local playerA = { '2', '4' }
    local playerB = { '3', '5', '6' }
    local expected = { status = 'finished', tricks = 1, cards = 4 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('the ace reigns supreme', function()
    local playerA = { '2', 'A' }
    local playerB = { '3', '4', '5', '6', '7' }
    local expected = { status = 'finished', tricks = 1, cards = 7 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('the king beats ace', function()
    local playerA = { '2', 'A' }
    local playerB = { '3', '4', '5', '6', 'K' }
    local expected = { status = 'finished', tricks = 1, cards = 7 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('the queen seduces the king', function()
    local playerA = { '2', 'A', '7', '8', 'Q' }
    local playerB = { '3', '4', '5', '6', 'K' }
    local expected = { status = 'finished', tricks = 1, cards = 10 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('the jack betrays the queen', function()
    local playerA = { '2', 'A', '7', '8', 'Q' }
    local playerB = { '3', '4', '5', '6', 'K', '9', 'J' }
    local expected = { status = 'finished', tricks = 1, cards = 12 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('the 10 just wants to put on a show', function()
    local playerA = { '2', 'A', '7', '8', 'Q', '10' }
    local playerB = { '3', '4', '5', '6', 'K', '9', 'J' }
    local expected = { status = 'finished', tricks = 1, cards = 13 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('simple loop with decks of 3 cards', function()
    local playerA = { 'J', '2', '3' }
    local playerB = { '4', 'J', '5' }
    local expected = { status = 'loop', tricks = 3, cards = 8 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('the story is starting to get a bit complicated', function()
    local playerA = {
      '2',
      '6',
      '6',
      'J',
      '4',
      'K',
      'Q',
      '10',
      'K',
      'J',
      'Q',
      '2',
      '3',
      'K',
      '5',
      '6',
      'Q',
      'Q',
      'A',
      'A',
      '6',
      '9',
      'K',
      'A',
      '8',
      'K',
      '2',
      'A',
      '9',
      'A',
      'Q',
      '4',
      'K',
      'K',
      'K',
      '3',
      '5',
      'K',
      '8',
      'Q',
      '3',
      'Q',
      '7',
      'J',
      'K',
      'J',
      '9',
      'J',
      '3',
      '3',
      'K',
      'K',
      'Q',
      'A',
      'K',
      '7',
      '10',
      'A',
      'Q',
      '7',
      '10',
      'J',
      '4',
      '5',
      'J',
      '9',
      '10',
      'Q',
      'J',
      'J',
      'K',
      '6',
      '10',
      'J',
      '6',
      'Q',
      'J',
      '5',
      'J',
      'Q',
      'Q',
      '8',
      '3',
      '8',
      'A',
      '2',
      '6',
      '9',
      'K',
      '7',
      'J',
      'K',
      'K',
      '8',
      'K',
      'Q',
      '6',
      '10',
      'J',
      '10',
      'J',
      'Q',
      'J',
      '10',
      '3',
      '8',
      'K',
      'A',
      '6',
      '9',
      'K',
      '2',
      'A',
      'A',
      '10',
      'J',
      '6',
      'A',
      '4',
      'J',
      'A',
      'J',
      'J',
      '6',
      '2',
      'J',
      '3',
      'K',
      '2',
      '5',
      '9',
      'J',
      '9',
      '6',
      'K',
      'A',
      '5',
      'Q',
      'J',
      '2',
      'Q',
      'K',
      'A',
      '3',
      'K',
      'J',
      'K',
      '2',
      '5',
      '6',
      'Q',
      'J',
      'Q',
      'Q',
      'J',
      '2',
      'J',
      '9',
      'Q',
      '7',
      '7',
      'A',
      'Q',
      '7',
      'Q',
      'J',
      'K',
      'J',
      'A',
      '7',
      '7',
      '8',
      'Q',
      '10',
      'J',
      '10',
      'J',
      'J',
      '9',
      '2',
      'A',
      '2'
    }
    local playerB = {
      '7',
      '2',
      '10',
      'K',
      '8',
      '2',
      'J',
      '9',
      'A',
      '5',
      '6',
      'J',
      'Q',
      '6',
      'K',
      '6',
      '5',
      'A',
      '4',
      'Q',
      '7',
      'J',
      '7',
      '10',
      '2',
      'Q',
      '8',
      '2',
      '2',
      'K',
      'J',
      'A',
      '5',
      '5',
      'A',
      '4',
      'Q',
      '6',
      'Q',
      'K',
      '10',
      '8',
      'Q',
      '2',
      '10',
      'J',
      'A',
      'Q',
      '8',
      'Q',
      'Q',
      'J',
      'J',
      'A',
      'A',
      '9',
      '10',
      'J',
      'K',
      '4',
      'Q',
      '10',
      '10',
      'J',
      'K',
      '10',
      '2',
      'J',
      '7',
      'A',
      'K',
      'K',
      'J',
      'A',
      'J',
      '10',
      '8',
      'K',
      'A',
      '7',
      'Q',
      'Q',
      'J',
      '3',
      'Q',
      '4',
      'A',
      '3',
      'A',
      'Q',
      'Q',
      'Q',
      '5',
      '4',
      'K',
      'J',
      '10',
      'A',
      'Q',
      'J',
      '6',
      'J',
      'A',
      '10',
      'A',
      '5',
      '8',
      '3',
      'K',
      '5',
      '9',
      'Q',
      '8',
      '7',
      '7',
      'J',
      '7',
      'Q',
      'Q',
      'Q',
      'A',
      '7',
      '8',
      '9',
      'A',
      'Q',
      'A',
      'K',
      '8',
      'A',
      'A',
      'J',
      '8',
      '4',
      '8',
      'K',
      'J',
      'A',
      '10',
      'Q',
      '8',
      'J',
      '8',
      '6',
      '10',
      'Q',
      'J',
      'J',
      'A',
      'A',
      'J',
      '5',
      'Q',
      '6',
      'J',
      'K',
      'Q',
      '8',
      'K',
      '4',
      'Q',
      'Q',
      '6',
      'J',
      'K',
      '4',
      '7',
      'J',
      'J',
      '9',
      '9',
      'A',
      'Q',
      'Q',
      'K',
      'A',
      '6',
      '5',
      'K'
    }
    local expected = { status = 'finished', tricks = 1, cards = 361 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('two tricks', function()
    local playerA = { 'J' }
    local playerB = { '3', 'J' }
    local expected = { status = 'finished', tricks = 2, cards = 5 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('more tricks', function()
    local playerA = { 'J', '2', '4' }
    local playerB = { '3', 'J', 'A' }
    local expected = { status = 'finished', tricks = 4, cards = 12 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('simple loop with decks of 4 cards', function()
    local playerA = { '2', '3', 'J', '6' }
    local playerB = { 'K', '5', 'J', '7' }
    local expected = { status = 'loop', tricks = 4, cards = 16 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('easy card combination', function()
    local playerA = {
      '4',
      '8',
      '7',
      '5',
      '4',
      '10',
      '3',
      '9',
      '7',
      '3',
      '10',
      '10',
      '6',
      '8',
      '2',
      '8',
      '5',
      '4',
      '5',
      '9',
      '6',
      '5',
      '2',
      '8',
      '10',
      '9'
    }
    local playerB = {
      '6',
      '9',
      '4',
      '7',
      '2',
      '2',
      '3',
      '6',
      '7',
      '3',
      'A',
      'A',
      'A',
      'A',
      'K',
      'K',
      'K',
      'K',
      'Q',
      'Q',
      'Q',
      'Q',
      'J',
      'J',
      'J',
      'J'
    }
    local expected = { status = 'finished', tricks = 4, cards = 40 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('easy card combination, inverted decks', function()
    local playerA = {
      '3',
      '3',
      '5',
      '7',
      '3',
      '2',
      '10',
      '7',
      '6',
      '7',
      'A',
      'A',
      'A',
      'A',
      'K',
      'K',
      'K',
      'K',
      'Q',
      'Q',
      'Q',
      'Q',
      'J',
      'J',
      'J',
      'J'
    }
    local playerB = {
      '5',
      '10',
      '8',
      '2',
      '6',
      '7',
      '2',
      '4',
      '9',
      '2',
      '6',
      '10',
      '10',
      '5',
      '4',
      '8',
      '4',
      '8',
      '6',
      '9',
      '8',
      '5',
      '9',
      '3',
      '4',
      '9'
    }
    local expected = { status = 'finished', tricks = 4, cards = 40 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('mirrored decks', function()
    local playerA = {
      '2',
      'A',
      '3',
      'A',
      '3',
      'K',
      '4',
      'K',
      '2',
      'Q',
      '2',
      'Q',
      '10',
      'J',
      '5',
      'J',
      '6',
      '10',
      '2',
      '9',
      '10',
      '7',
      '3',
      '9',
      '6',
      '9'
    }
    local playerB = {
      '6',
      'A',
      '4',
      'A',
      '7',
      'K',
      '4',
      'K',
      '7',
      'Q',
      '7',
      'Q',
      '5',
      'J',
      '8',
      'J',
      '4',
      '5',
      '8',
      '9',
      '10',
      '6',
      '8',
      '3',
      '8',
      '5'
    }
    local expected = { status = 'finished', tricks = 4, cards = 59 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('opposite decks', function()
    local playerA = {
      '4',
      'A',
      '9',
      'A',
      '4',
      'K',
      '9',
      'K',
      '6',
      'Q',
      '8',
      'Q',
      '8',
      'J',
      '10',
      'J',
      '9',
      '8',
      '4',
      '6',
      '3',
      '6',
      '5',
      '2',
      '4',
      '3'
    }
    local playerB = {
      '10',
      '7',
      '3',
      '2',
      '9',
      '2',
      '7',
      '8',
      '7',
      '5',
      'J',
      '7',
      'J',
      '10',
      'Q',
      '10',
      'Q',
      '3',
      'K',
      '5',
      'K',
      '6',
      'A',
      '2',
      'A',
      '5'
    }
    local expected = { status = 'finished', tricks = 21, cards = 151 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('random decks #1', function()
    local playerA = {
      'K',
      '10',
      '9',
      '8',
      'J',
      '8',
      '6',
      '9',
      '7',
      'A',
      'K',
      '5',
      '4',
      '4',
      'J',
      '5',
      'J',
      '4',
      '3',
      '5',
      '8',
      '6',
      '7',
      '7',
      '4',
      '9'
    }
    local playerB = {
      '6',
      '3',
      'K',
      'A',
      'Q',
      '10',
      'A',
      '2',
      'Q',
      '8',
      '2',
      '10',
      '10',
      '2',
      'Q',
      '3',
      'K',
      '9',
      '7',
      'A',
      '3',
      'Q',
      '5',
      'J',
      '2',
      '6'
    }
    local expected = { status = 'finished', tricks = 76, cards = 542 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('random decks #2', function()
    local playerA = {
      '8',
      'A',
      '4',
      '8',
      '5',
      'Q',
      'J',
      '2',
      '6',
      '2',
      '9',
      '7',
      'K',
      'A',
      '8',
      '10',
      'K',
      '8',
      '10',
      '9',
      'K',
      '6',
      '7',
      '3',
      'K',
      '9'
    }
    local playerB = {
      '10',
      '5',
      '2',
      '6',
      'Q',
      'J',
      'A',
      '9',
      '5',
      '5',
      '3',
      '7',
      '3',
      'J',
      'A',
      '2',
      'Q',
      '3',
      'J',
      'Q',
      '4',
      '10',
      '4',
      '7',
      '4',
      '6'
    }
    local expected = { status = 'finished', tricks = 42, cards = 327 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('kleber 1999', function()
    local playerA = {
      '4',
      '8',
      '9',
      'J',
      'Q',
      '8',
      '5',
      '5',
      'K',
      '2',
      'A',
      '9',
      '8',
      '5',
      '10',
      'A',
      '4',
      'J',
      '3',
      'K',
      '6',
      '9',
      '2',
      'Q',
      'K',
      '7'
    }
    local playerB = {
      '10',
      'J',
      '3',
      '2',
      '4',
      '10',
      '4',
      '7',
      '5',
      '3',
      '6',
      '6',
      '7',
      'A',
      'J',
      'Q',
      'A',
      '7',
      '2',
      '10',
      '3',
      'K',
      '9',
      '6',
      '8',
      'Q'
    }
    local expected = { status = 'finished', tricks = 805, cards = 5790 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('collins 2006', function()
    local playerA = {
      'A',
      '8',
      'Q',
      'K',
      '9',
      '10',
      '3',
      '7',
      '4',
      '2',
      'Q',
      '3',
      '2',
      '10',
      '9',
      'K',
      'A',
      '8',
      '7',
      '7',
      '4',
      '5',
      'J',
      '9',
      '2',
      '10'
    }
    local playerB = {
      '4',
      'J',
      'A',
      'K',
      '8',
      '5',
      '6',
      '6',
      'A',
      '6',
      '5',
      'Q',
      '4',
      '6',
      '10',
      '8',
      'J',
      '2',
      '5',
      '7',
      'Q',
      'J',
      '3',
      '3',
      'K',
      '9'
    }
    local expected = { status = 'finished', tricks = 960, cards = 6913 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('mann and wu 2007', function()
    local playerA = {
      'K',
      '2',
      'K',
      'K',
      '3',
      '3',
      '6',
      '10',
      'K',
      '6',
      'A',
      '2',
      '5',
      '5',
      '7',
      '9',
      'J',
      'A',
      'A',
      '3',
      '4',
      'Q',
      '4',
      '8',
      'J',
      '6'
    }
    local playerB = {
      '4',
      '5',
      '2',
      'Q',
      '7',
      '9',
      '9',
      'Q',
      '7',
      'J',
      '9',
      '8',
      '10',
      '3',
      '10',
      'J',
      '4',
      '10',
      '8',
      '6',
      '8',
      '7',
      'A',
      'Q',
      '5',
      '2'
    }
    local expected = { status = 'finished', tricks = 1007, cards = 7157 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('nessler 2012', function()
    local playerA = {
      '10',
      '3',
      '6',
      '7',
      'Q',
      '2',
      '9',
      '8',
      '2',
      '8',
      '4',
      'A',
      '10',
      '6',
      'K',
      '2',
      '10',
      'A',
      '5',
      'A',
      '2',
      '4',
      'Q',
      'J',
      'K',
      '4'
    }
    local playerB = {
      '10',
      'Q',
      '4',
      '6',
      'J',
      '9',
      '3',
      'J',
      '9',
      '3',
      '3',
      'Q',
      'K',
      '5',
      '9',
      '5',
      'K',
      '6',
      '5',
      '7',
      '8',
      'J',
      'A',
      '7',
      '8',
      '7'
    }
    local expected = { status = 'finished', tricks = 1015, cards = 7207 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('anderson 2013', function()
    local playerA = {
      '6',
      '7',
      'A',
      '3',
      'Q',
      '3',
      '5',
      'J',
      '3',
      '2',
      'J',
      '7',
      '4',
      '5',
      'Q',
      '10',
      '5',
      'A',
      'J',
      '2',
      'K',
      '8',
      '9',
      '9',
      'K',
      '3'
    }
    local playerB = {
      '4',
      'J',
      '6',
      '9',
      '8',
      '5',
      '10',
      '7',
      '9',
      'Q',
      '2',
      '7',
      '10',
      '8',
      '4',
      '10',
      'A',
      '6',
      '4',
      'A',
      '6',
      '8',
      'Q',
      'K',
      'K',
      '2'
    }
    local expected = { status = 'finished', tricks = 1016, cards = 7225 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('rucklidge 2014', function()
    local playerA = {
      '8',
      'J',
      '2',
      '9',
      '4',
      '4',
      '5',
      '8',
      'Q',
      '3',
      '9',
      '3',
      '6',
      '2',
      '8',
      'A',
      'A',
      'A',
      '9',
      '4',
      '7',
      '2',
      '5',
      'Q',
      'Q',
      '3'
    }
    local playerB = {
      'K',
      '7',
      '10',
      '6',
      '3',
      'J',
      'A',
      '7',
      '6',
      '5',
      '5',
      '8',
      '10',
      '9',
      '10',
      '4',
      '2',
      '7',
      'K',
      'Q',
      '10',
      'K',
      '6',
      'J',
      'J',
      'K'
    }
    local expected = { status = 'finished', tricks = 1122, cards = 7959 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('nessler 2021', function()
    local playerA = {
      '7',
      '2',
      '3',
      '4',
      'K',
      '9',
      '6',
      '10',
      'A',
      '8',
      '9',
      'Q',
      '7',
      'A',
      '4',
      '8',
      'J',
      'J',
      'A',
      '4',
      '3',
      '2',
      '5',
      '6',
      '6',
      'J'
    }
    local playerB = {
      '3',
      '10',
      '8',
      '9',
      '8',
      'K',
      'K',
      '2',
      '5',
      '5',
      '7',
      '6',
      '4',
      '3',
      '5',
      '7',
      'A',
      '9',
      'J',
      'K',
      '2',
      'Q',
      '10',
      'Q',
      '10',
      'Q'
    }
    local expected = { status = 'finished', tricks = 1106, cards = 7972 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('nessler 2022', function()
    local playerA = {
      '2',
      '10',
      '10',
      'A',
      'J',
      '3',
      '8',
      'Q',
      '2',
      '5',
      '5',
      '5',
      '9',
      '2',
      '4',
      '3',
      '10',
      'Q',
      'A',
      'K',
      'Q',
      'J',
      'J',
      '9',
      'Q',
      'K'
    }
    local playerB = {
      '10',
      '7',
      '6',
      '3',
      '6',
      'A',
      '8',
      '9',
      '4',
      '3',
      'K',
      'J',
      '6',
      'K',
      '4',
      '9',
      '7',
      '8',
      '5',
      '7',
      '8',
      '2',
      'A',
      '7',
      '4',
      '6'
    }
    local expected = { status = 'finished', tricks = 1164, cards = 8344 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)

  it('casella 2024, first infinite game found', function()
    local playerA = {
      '2',
      '8',
      '4',
      'K',
      '5',
      '2',
      '3',
      'Q',
      '6',
      'K',
      'Q',
      'A',
      'J',
      '3',
      '5',
      '9',
      '8',
      '3',
      'A',
      'A',
      'J',
      '4',
      '4',
      'J',
      '7',
      '5'
    }
    local playerB = {
      '7',
      '7',
      '8',
      '6',
      '10',
      '10',
      '6',
      '10',
      '7',
      '2',
      'Q',
      '6',
      '3',
      '2',
      '4',
      'K',
      'Q',
      '10',
      'J',
      '5',
      '9',
      '8',
      '9',
      '9',
      'K',
      'A'
    }
    local expected = { status = 'loop', tricks = 66, cards = 474 }
    local result = camicia.simulate_game(playerA, playerB)
    assert.are.same(expected, result)
  end)
end)
