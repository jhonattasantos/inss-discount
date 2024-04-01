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

    context 'when salary is equal to the maximum of the first range' do
      it 'returns the correct INSS discount' do
        salary = 1045.00
        expected_discount = 78.37

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is equal to the minimum of the second range' do
      it 'returns the correct INSS discount' do
        salary = 1045.01
        expected_discount = 78.37

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is equal to the maximum of the second range' do
      it 'returns the correct INSS discount' do
        salary = 2089.60
        expected_discount = 172.38

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is equal to the minimum of the third range' do
      it 'returns the correct INSS discount' do
        salary = 2089.61
        expected_discount = 172.38

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is equal to the maximum of the third range' do
      it 'returns the correct INSS discount' do
        salary = 3134.40
        expected_discount = 297.75

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is equal to the minimum of the fourth range' do
      it 'returns the correct INSS discount' do
        salary = 3134.41
        expected_discount = 297.75

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is equal to the maximum of the fourth range' do
      it 'returns the correct INSS discount' do
        salary = 6101.06
        expected_discount = 713.08

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end

    context 'when salary is greater than the maximum of the fourth range' do
      it 'returns the correct INSS discount' do
        salary = 7000
        expected_discount = 713.08

        expect(described_class.calculate(salary)).to eq(expected_discount)
      end
    end
  end
end