class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :cpf
      t.date :birthdate
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :personal_phone
      t.string :reference_phone
      t.decimal :salary
      t.decimal :inss_discount

      t.timestamps
    end
  end
end
