class AddNameAndSpecializationToDoctors < ActiveRecord::Migration[8.0]
  def change
    add_column :doctors, :name, :string unless column_exists?(:doctors, :name)
    add_column :doctors, :specialization, :string unless column_exists?(:doctors, :specialization)
  end
end
