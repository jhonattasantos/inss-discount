# Responsible for calculating INSS deductions based on salary.
class InssCalculator
  # INSS rates and salary ranges.
  INSS_RANGES = [
    { min_salary: 0.0, max_salary: 1045.00, rate: 0.075 },
    { min_salary: 1045.01, max_salary: 2089.60, rate: 0.09 },
    { min_salary: 2089.61, max_salary: 3134.40, rate: 0.12 },
    { min_salary: 3134.41, max_salary: 6101.06, rate: 0.14 }
  ].freeze

  # Calculates the INSS deduction based on the provided salary.
  #
  # Parameters:
  #   - salary: The salary from which the INSS deduction will be calculated.
  #
  # Returns:
  #   The value of the INSS deduction, rounded to two decimal places.
  def self.calculate(salary)
    total_discount = 0.0

    INSS_RANGES.each do |range|
      max_salary = range[:max_salary]
      min_salary = range[:min_salary]
      rate = range[:rate]

      if salary > max_salary
        total_discount += ((max_salary - min_salary) * rate).floor(2)
      else
        total_discount += ((salary - min_salary) * rate).floor(2)
        break
      end
    end

    total_discount.floor(2)
  end
end
