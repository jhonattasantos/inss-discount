class AddNeighborhoodAndNumberToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :neighborhood, :string
    add_column :employees, :number, :string
  end
end
