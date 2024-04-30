class HomeController < ApplicationController
  def index
    @salary_ranges_report = Employee.salary_ranges_report
  end
end
