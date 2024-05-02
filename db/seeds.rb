FactoryBot.create_list(:employee, 20)

User.create!(email: 'username@credishop.com', password: '123456', password_confirmation: '123456')
