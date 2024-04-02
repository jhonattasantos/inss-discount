require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'assigns the salary ranges report to @report' do
      report = {
        'Até R$ 1.045,00' => 1,
        'De R$ 1.045,01 a R$ 2.089,60' => 2,
        'De R$ 2.089,61 até R$ 3.134,40' => 1,
        'De R$ 3.134,41 até R$ 6.101,06' => 1
      }
      allow(Employee).to receive(:salary_ranges_report).and_return(report)

      get :index

      expect(assigns(:report)).to eq(report)
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end