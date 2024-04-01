require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  let(:employee) {
    Employee.create!(
      name: "MyString",
      cpf: "MyString",
      address: "MyString",
      city: "MyString",
      state: "MyString",
      zip_code: "MyString",
      personal_phone: "MyString",
      reference_phone: "MyString",
      salary: "9.99",
      inss_discount: "9.99"
    )
  }

  before(:each) do
    assign(:employee, employee)
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(employee), "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[cpf]"

      assert_select "input[name=?]", "employee[address]"

      assert_select "input[name=?]", "employee[city]"

      assert_select "input[name=?]", "employee[state]"

      assert_select "input[name=?]", "employee[zip_code]"

      assert_select "input[name=?]", "employee[personal_phone]"

      assert_select "input[name=?]", "employee[reference_phone]"

      assert_select "input[name=?]", "employee[salary]"

      assert_select "input[name=?]", "employee[inss_discount]"
    end
  end
end
