class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: :calculate_contribution
  before_action :authenticate_user!

  # GET /employees or /employees.json
  def index
    @employees = Employee.page(params[:page] || 1)
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: I18n.t('employees.create.success') }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        UpdateSalaryWorker.perform_async(@employee.id, employee_params[:salary])
        format.html { redirect_to employee_url(@employee), notice: I18n.t('employees.update.success') }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!

    respond_to do |format|
      format.html { redirect_to employees_url, notice: I18n.t('employees.destroy.success') }
      format.json { head :no_content }
    end
  end

  def calculate_contribution
    salary = params[:salary].to_f
    inss_discount = InssCalculator.calculate(salary)
    render json: { inss_discount: }
  end

  def salary_ranges_report
    @salary_ranges_report = Employee.salary_ranges_report
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:name, :cpf, :birthdate, :address, :city, :state, :zip_code, :personal_phone,
                                     :reference_phone, :salary, :inss_discount, :neighborhood, :number)
  end
end
