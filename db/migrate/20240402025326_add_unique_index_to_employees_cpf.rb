class AddUniqueIndexToEmployeesCpf < ActiveRecord::Migration[7.1]
  def change
    add_index :employees, :cpf, unique: true
  end
end
