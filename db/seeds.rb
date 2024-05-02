FactoryBot.create_list(:employee, 30)

User.create!(email: 'username@company.com', password: '123456', password_confirmation: '123456')
