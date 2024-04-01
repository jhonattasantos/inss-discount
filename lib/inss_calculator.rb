class InssCalculator
  def calculate(salary)
    inss_ranges = [
      { min_salary: 0.0, max_salary: 1045.00, rate: 0.075 },
      { min_salary: 1045.01, max_salary: 2089.60, rate: 0.09 },
      { min_salary: 2089.61, max_salary: 3134.40, rate: 0.12 },
      { min_salary: 3134.41, max_salary: Float::INFINITY, rate: 0.14 }
    ]

    total_discount = 0.0
    inss_ranges.each do |range|
      if salary > range[:max_salary]
        total_discount += ((range[:max_salary] - range[:min_salary]) * range[:rate]).floor(2)
      else
        total_discount += ((salary - range[:min_salary]) * range[:rate]).floor(2)
        break
      end
    end

    total_discount.floor(2)
  end
end
