class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.datetime :appointment_date
      t.string :status, default: 'scheduled'

      t.timestamps
    end
  end
end
