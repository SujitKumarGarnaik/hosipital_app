class ChangeDefaultStatusInAppointments < ActiveRecord::Migration[8.0]
  def change
    change_column_default :appointments, :status, from: nil, to: "scheduled"
  end
end
