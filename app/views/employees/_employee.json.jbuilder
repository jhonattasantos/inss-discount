json.extract! employee, :id, :name, :cpf, :birthdate, :address, :city, :state, :zip_code, :personal_phone, :reference_phone, :salary, :inss_discount, :created_at, :updated_at
json.url employee_url(employee, format: :json)
