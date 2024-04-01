require 'rails_helper'

RSpec.describe InssCalculator do
  describe '#calculate' do
    context 'when salary is within the first range' do
      it 'returns the correct INSS discount' do
        salary = 1000
        expected_discount = 75.0

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is within the second range' do
      it 'returns the correct INSS discount' do
        salary = 1500
        expected_discount = 119.31

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is within the third range' do
      it 'returns the correct INSS discount' do
        salary = 3000
        expected_discount = 281.62

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end
  end
end