local Complex = require('complex-numbers')

describe('complex-numbers', function()
  local pi = math.pi
  local e = math.exp(1)
  local ln = math.log

  describe('real part', function()
    it('real part of a purely real number', function()
      assert.equal(1, Complex(1, 0).r)
    end)

    it('real part of a purely imaginary number', function()
      assert.equal(0, Complex(0, 1).r)
    end)

    it('real part of a number with real and imaginary part', function()
      assert.equal(1, Complex(1, 2).r)
    end)
  end)

  describe('imaginary part', function()
    it('imaginary part of a purely real number', function()
      assert.equal(0, Complex(1, 0).i)
    end)

    it('imaginary part of a purely imaginary number', function()
      assert.equal(1, Complex(0, 1).i)
    end)

    it('imaginary part of a number with real and imaginary part', function()
      assert.equal(2, Complex(1, 2).i)
    end)
  end)

  it('imaginary unit', function()
    assert.equal(Complex(-1, 0), Complex(0, 1) * Complex(0, 1))
  end)

  describe('arithmetic', function()
    describe('addition', function()
      it('add purely real numbers', function()
        assert.equal(Complex(3, 0), Complex(1, 0) + Complex(2, 0))
      end)

      it('add purely imaginary numbers', function()
        assert.equal(Complex(0, 3), Complex(0, 1) + Complex(0, 2))
      end)

      it('add numbers with real and imaginary part', function()
        assert.equal(Complex(4, 6), Complex(1, 2) + Complex(3, 4))
      end)
    end)

    describe('subtraction', function()
      it('subtract purely real numbers', function()
        assert.equal(Complex(-1, 0), Complex(1, 0) - Complex(2, 0))
      end)

      it('subtract purely imaginary numbers', function()
        assert.equal(Complex(0, -1), Complex(0, 1) - Complex(0, 2))
      end)

      it('subtract numbers with real and imaginary part', function()
        assert.equal(Complex(-2, -2), Complex(1, 2) - Complex(3, 4))
      end)
    end)

    describe('multiplication', function()
      it('multiply purely real numbers', function()
        assert.equal(Complex(2, 0), Complex(1, 0) * Complex(2, 0))
      end)

      it('multiply purely imaginary numbers', function()
        assert.equal(Complex(-2, 0), Complex(0, 1) * Complex(0, 2))
      end)

      it('multiply numbers with real and imaginary part', function()
        assert.equal(Complex(-5, 10), Complex(1, 2) * Complex(3, 4))
      end)
    end)

    describe('division', function()
      it('divide purely real numbers', function()
        assert.equal(Complex(0.5, 0), Complex(1, 0) / Complex(2, 0))
      end)

      it('divide purely imaginary numbers', function()
        assert.equal(Complex(0.5, 0), Complex(0, 1) / Complex(0, 2))
      end)

      it('divide numbers with real and imaginary part', function()
        assert.equal(Complex(0.44, 0.08), Complex(1, 2) / Complex(3, 4))
      end)
    end)
  end)

  describe('absolute value', function()
    it('absolute value of a positive purely real number', function()
      assert.equal(5, Complex(5, 0).abs())
    end)

    it('absolute value of a negative purely real number', function()
      assert.equal(5, Complex(-5, 0).abs())
    end)

    it('absolute value of a purely imaginary number with positive imaginary part', function()
      assert.equal(5, Complex(0, 5).abs())
    end)

    it('absolute value of a purely imaginary number with negative imaginary part', function()
      assert.equal(5, Complex(0, -5).abs())
    end)

    it('absolute value of a number with real and imaginary part', function()
      assert.equal(5, Complex(3, 4).abs())
    end)
  end)

  describe('complex conjugate', function()
    it('conjugate a purely real number', function()
      assert.equal(Complex(5, 0), Complex(5, 0).conj())
    end)

    it('conjugate a purely imaginary number', function()
      assert.equal(Complex(0, -5), Complex(0, 5).conj())
    end)

    it('conjugate a number with real and imaginary part', function()
      assert.equal(Complex(1, -1), Complex(1, 1).conj())
    end)
  end)

  describe('complex exponential function', function()
    it('euler\'s identity/formula', function()
      assert.equal(Complex(-1, 0), Complex(0, pi).exp())
    end)

    it('exponential of 0', function()
      assert.equal(Complex(1, 0), Complex(0, 0).exp())
    end)

    it('exponential of a purely real number', function()
      assert.equal(Complex(e, 0), Complex(1, 0).exp())
    end)

    it('exponential of a number with real and imaginary part', function()
      assert.equal(Complex(-2, 0), Complex(ln(2), pi).exp())
    end)

    it('exponential resulting in a number with real and imaginary part', function()
      assert.equal(Complex(1, 1), Complex(ln(2) / 2, pi / 4).exp())
    end)
  end)

  describe('operations between real numbers and complex numbers', function()
    it('add real number to complex number', function()
      assert.equal(Complex(6, 2), Complex(1, 2) + Complex(5))
    end)

    it('add complex number to real number', function()
      assert.equal(Complex(6, 2), Complex(5) + Complex(1, 2))
    end)

    it('subtract real number from complex number', function()
      assert.equal(Complex(1, 7), Complex(5, 7) - Complex(4))
    end)

    it('subtract complex number from real number', function()
      assert.equal(Complex(-1, -7), Complex(4) - Complex(5, 7))
    end)

    it('multiply complex number by real number', function()
      assert.equal(Complex(10, 25), Complex(2, 5) * Complex(5))
    end)

    it('multiply real number by complex number', function()
      assert.equal(Complex(10, 25), Complex(5) * Complex(2, 5))
    end)

    it('divide complex number by real number', function()
      assert.equal(Complex(1, 10), Complex(10, 100) / Complex(10))
    end)

    it('divide real number by complex number', function()
      assert.equal(Complex(2.5, -2.5), Complex(5) / Complex(1, 1))
    end)
  end)
end)
