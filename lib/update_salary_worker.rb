class UpdateSalaryWorker
  include Sidekiq::Worker

  def perform(employee_id, new_salary)
    employee = Employee.find(employee_id)
    inss_discount = InssCalculator.calculate(new_salary.to_f)

    employee.update(salary: new_salary, inss_discount: inss_discount)
  end
end