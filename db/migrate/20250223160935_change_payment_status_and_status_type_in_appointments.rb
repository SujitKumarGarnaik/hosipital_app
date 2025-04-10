class ChangePaymentStatusAndStatusTypeInAppointments < ActiveRecord::Migration[6.1]
  def change
    change_column :appointments, :payment_status, :string
    change_column :appointments, :status, :string
  end
end
