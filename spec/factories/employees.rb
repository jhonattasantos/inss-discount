FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_citizen_number }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
    personal_phone { Faker::PhoneNumber.cell_phone }
    reference_phone { Faker::PhoneNumber.cell_phone }
    salary { Faker::Number.between(from: 500, to: 6_101) }
    inss_discount { InssCalculator.calculate(salary) }
  end
end
