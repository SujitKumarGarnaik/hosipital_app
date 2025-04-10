class ChangeDoctorIdInPatients < ActiveRecord::Migration[8.0]
  def change
    if foreign_key_exists?(:patients, :doctors)
      remove_foreign_key :patients, :doctors
    end
  end
end
