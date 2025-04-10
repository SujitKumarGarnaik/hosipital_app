class AddDetailsToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :name, :string unless column_exists?(:patients, :name)
    add_column :patients, :address, :string unless column_exists?(:patients, :address)
    add_column :patients, :phone, :string unless column_exists?(:patients, :phone)
  end
end
