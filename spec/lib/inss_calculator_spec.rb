require 'rails_helper'

RSpec.describe InssCalculator do
  describe '#calculate' do
    context 'when salary is within the third range' do
      it 'returns the correct INSS discount' do
        calculator = InssCalculator.new
        salary = 3000
        expected_discount = 281.62

        expect(calculator.calculate(salary)).to eq(expected_discount)
      end
    end
  end
end