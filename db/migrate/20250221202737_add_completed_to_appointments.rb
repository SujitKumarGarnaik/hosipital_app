class AddCompletedToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :completed, :boolean
  end
end
