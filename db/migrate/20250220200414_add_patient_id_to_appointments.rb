class AddPatientIdToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :patient_id, :integer unless column_exists?(:appointments, :patient_id)
  end
end
