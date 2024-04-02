class Employee < ApplicationRecord
  validates :name, :cpf, :salary, :inss_discount, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :salary, numericality: { greater_than: 0 }
  validates :inss_discount, numericality: { greater_than_or_equal_to: 0 }

  def self.salary_ranges_report
    ranges = {
      'Até R$ 1.045,00' => (0..1045.00),
      'De R$ 1.045,01 a R$ 2.089,60' => (1045.01..2089.60),
      'De R$ 2.089,61 até R$ 3.134,40' => (2089.61..3134.40),
      'De R$ 3.134,41 até R$ 6.101,06' => (3134.41..6101.06)
    }

    report = {}
    ranges.each do |range_name, range|
      report[range_name] = Employee.where(salary: range).count
    end

    report
  end
end
