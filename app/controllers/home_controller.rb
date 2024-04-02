class HomeController < ApplicationController
  def index
    @report = Employee.salary_ranges_report
  end
end
