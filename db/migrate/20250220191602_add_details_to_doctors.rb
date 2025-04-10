class AddDetailsToDoctors < ActiveRecord::Migration[8.0]
  def change
    add_column :doctors, :name, :string unless column_exists?(:doctors, :name)
    add_column :doctors, :specialization, :string unless column_exists?(:doctors, :specialization)
    add_column :doctors, :address, :string unless column_exists?(:doctors, :address)
    add_column :doctors, :joining_date, :date unless column_exists?(:doctors, :joining_date)
  end
end
