require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        name: "Name",
        cpf: "Cpf",
        address: "Address",
        city: "City",
        state: "State",
        zip_code: "Zip Code",
        personal_phone: "Personal Phone",
        reference_phone: "Reference Phone",
        salary: "9.99",
        inss_discount: "9.99"
      ),
      Employee.create!(
        name: "Name",
        cpf: "Cpf",
        address: "Address",
        city: "City",
        state: "State",
        zip_code: "Zip Code",
        personal_phone: "Personal Phone",
        reference_phone: "Reference Phone",
        salary: "9.99",
        inss_discount: "9.99"
      )
    ])
  end

  it "renders a list of employees" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Zip Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Personal Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Reference Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
