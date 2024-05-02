require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  describe 'GET #index' do
    it 'assigns @employees' do
      employee = create(:employee)
      get :index
      expect(assigns(:employees)).to eq([employee])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested employee to @employee' do
      employee = create(:employee)
      get :show, params: { id: employee.id }
      expect(assigns(:employee)).to eq(employee)
    end

    it 'renders the show template' do
      employee = create(:employee)
      get :show, params: { id: employee.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new employee to @employee' do
      get :new
      expect(assigns(:employee)).to be_a_new(Employee)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new employee' do
        expect {
          post :create, params: { employee: attributes_for(:employee) }
        }.to change(Employee, :count).by(1)
      end

      it 'redirects to the created employee' do
        post :create, params: { employee: attributes_for(:employee) }
        expect(response).to redirect_to(employee_path(Employee.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new employee' do
        expect {
          post :create, params: { employee: attributes_for(:employee, name: nil) }
        }.to_not change(Employee, :count)
      end

      it 'renders the new template' do
        post :create, params: { employee: attributes_for(:employee, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:employee) { create(:employee) }

    context 'with valid params' do
      it 'updates the requested employee' do
        patch :update, params: { id: employee.id, employee: { name: 'New Name' } }
        employee.reload
        expect(employee.name).to eq('New Name')
      end

      it 'redirects to the employee' do
        patch :update, params: { id: employee.id, employee: { name: 'New Name' } }
        expect(response).to redirect_to(employee_path(employee))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested employee' do
        patch :update, params: { id: employee.id, employee: { name: nil } }
        employee.reload
        expect(employee.name).to_not be_nil
      end

      it 'renders the edit template' do
        patch :update, params: { id: employee.id, employee: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:employee) { create(:employee) }

    it 'destroys the requested employee' do
      expect {
        delete :destroy, params: { id: employee.id }
      }.to change(Employee, :count).by(-1)
    end

    it 'redirects to the employees list' do
      delete :destroy, params: { id: employee.id }
      expect(response).to redirect_to(employees_path)
    end
  end

  describe 'POST #calculate_contribution' do
    it 'calculates the INSS discount' do
      post :calculate_contribution, params: { salary: 3000.00 }
      expect(response.body).to eq({ inss_discount: 281.62 }.to_json)
    end
  end

  describe 'GET #salary_ranges_report'  do
    it 'assigns @salary_ranges_report' do
      get :salary_ranges_report
      expect(assigns(:salary_ranges_report)).to be_a(Hash)
    end
  end
end
