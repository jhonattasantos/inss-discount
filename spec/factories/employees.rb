FactoryBot.define do
  factory :employee do
    name { "MyString" }
    cpf { "MyString" }
    birthdate { "2024-04-01" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { "MyString" }
    personal_phone { "MyString" }
    reference_phone { "MyString" }
    salary { "9.99" }
    inss_discount { "9.99" }
  end
end
