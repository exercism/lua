local secret_handshake = require 'secret-handshake'

describe('secret-handshake', function()
  it('should allow empty handshakes', function()
    assert.are.same({}, secret_handshake(0))
  end)

  it('should interpret 0b1 as wink', function()
    assert.are.same({ 'wink' }, secret_handshake(tonumber('1', 2)))
  end)

  it('should interpret 0b10 as double blink', function()
    assert.are.same({ 'double blink' }, secret_handshake(tonumber('10', 2)))
  end)

  it('should interpret 0b100 as close your eyes', function()
    assert.are.same({ 'close your eyes' }, secret_handshake(tonumber('100', 2)))
  end)

  it('should interpret 0b1000 as jump', function()
    assert.are.same({ 'jump' }, secret_handshake(tonumber('1000', 2)))
  end)

  it('should allow multiple handshake primitives to be used together', function()
    assert.are.same({ 'wink', 'double blink' }, secret_handshake(tonumber('11', 2)))
  end)

  it('should reverse the order of the primitives when 0b10000 is used', function()
    assert.are.same({ 'double blink', 'wink' }, secret_handshake(tonumber('10011', 2)))
  end)

  it('should allow all primitives to be used together', function()
    assert.are.same(
      { 'jump', 'close your eyes', 'double blink', 'wink' },
      secret_handshake(tonumber('11111', 2))
    )
  end)
end)
