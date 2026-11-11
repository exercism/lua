local secret_handshake = require('secret-handshake')

describe('secret-handshake', function()
  it('wink for 1', function()
    assert.are.same({ 'wink' }, secret_handshake(1))
  end)

  it('double blink for 10', function()
    assert.are.same({ 'double blink' }, secret_handshake(2))
  end)

  it('close your eyes for 100', function()
    assert.are.same({ 'close your eyes' }, secret_handshake(4))
  end)

  it('jump for 1000', function()
    assert.are.same({ 'jump' }, secret_handshake(8))
  end)

  it('combine two actions', function()
    assert.are.same({ 'wink', 'double blink' }, secret_handshake(3))
  end)

  it('reverse two actions', function()
    assert.are.same({ 'double blink', 'wink' }, secret_handshake(19))
  end)

  it('reversing one action gives the same action', function()
    assert.are.same({ 'jump' }, secret_handshake(24))
  end)

  it('reversing no actions still gives no actions', function()
    assert.are.same({}, secret_handshake(16))
  end)

  it('all possible actions', function()
    assert.are.same({ 'wink', 'double blink', 'close your eyes', 'jump' }, secret_handshake(15))
  end)

  it('reverse all possible actions', function()
    assert.are.same({ 'jump', 'close your eyes', 'double blink', 'wink' }, secret_handshake(31))
  end)

  it('do nothing for zero', function()
    assert.are.same({}, secret_handshake(0))
  end)
end)
