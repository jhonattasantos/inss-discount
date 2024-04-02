require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe UpdateSalaryWorker, type: :worker do
  describe '#perform' do
    let(:employee) { create(:employee) }
    let(:new_salary) { 3000 }

    before do
      Sidekiq::Testing.inline!
    end

    it 'updates the employees salary and inss_discount' do
      UpdateSalaryWorker.perform_async(employee.id, new_salary)
      expect(employee.reload.salary).to eq(new_salary)
      expect(employee.reload.inss_discount).to eq(281.62)
    end
  end
end