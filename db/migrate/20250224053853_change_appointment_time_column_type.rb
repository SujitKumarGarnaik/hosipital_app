class ChangeAppointmentTimeColumnType < ActiveRecord::Migration[6.0]
  def change
    # Change the column type with explicit casting for conversion
    change_column :appointments, :appointment_time, :time, using: 'appointment_time::time'
  end
end
