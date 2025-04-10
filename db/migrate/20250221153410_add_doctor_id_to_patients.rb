class AddDoctorIdToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :doctor_id, :bigint
  end
end
