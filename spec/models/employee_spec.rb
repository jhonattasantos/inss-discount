require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:inss_discount) }
    it { should validate_uniqueness_of(:cpf).case_insensitive }
    it { should validate_numericality_of(:salary).is_greater_than(0) }
    it { should validate_numericality_of(:inss_discount).is_greater_than_or_equal_to(0) }
  end

  describe '.salary_ranges_report' do
    it 'returns the correct report of employee counts in each salary range' do
      create(:employee, salary: 1000.00)
      create(:employee, salary: 1500.00)
      create(:employee, salary: 2000.00)
      create(:employee, salary: 2500.00)
      create(:employee, salary: 3500.00)

      report = Employee.salary_ranges_report

      expect(report['Até R$ 1.045,00']).to eq(1)
      expect(report['De R$ 1.045,01 a R$ 2.089,60']).to eq(2)
      expect(report['De R$ 2.089,61 até R$ 3.134,40']).to eq(1)
      expect(report['De R$ 3.134,41 até R$ 6.101,06']).to eq(1)
    end
  end
end