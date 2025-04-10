class AddAppointmentTimeToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :appointment_time, :string
  end
end
