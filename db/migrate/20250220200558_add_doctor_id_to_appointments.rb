class AddDoctorIdToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :doctor_id, :integer unless column_exists?(:appointments, :doctor_id)
  end
end
