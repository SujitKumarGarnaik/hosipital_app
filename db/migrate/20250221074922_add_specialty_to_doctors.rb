class AddSpecialtyToDoctors < ActiveRecord::Migration[8.0]
  def change
    add_column :doctors, :specialty, :string unless column_exists?(:doctors, :specialty)
  end
end
