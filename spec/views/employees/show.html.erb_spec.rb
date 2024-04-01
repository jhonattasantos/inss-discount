require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    assign(:employee, Employee.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/Personal Phone/)
    expect(rendered).to match(/Reference Phone/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
