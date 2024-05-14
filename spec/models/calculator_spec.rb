require 'rails_helper'

RSpec.describe Calculator, type: :model do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(Calculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(Calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(Calculator.add("1,2")).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      expect(Calculator.add("1,2,3")).to eq(6)
    end

    it 'handles newlines between numbers' do
      expect(Calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(Calculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      expect { Calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'shows all negative numbers in the exception message' do
      expect { Calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2,-3")
    end
  end
end
