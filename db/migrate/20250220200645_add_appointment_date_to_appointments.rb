class AddAppointmentDateToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :appointment_date, :datetime unless column_exists?(:appointments, :appointment_date)
  end
end
