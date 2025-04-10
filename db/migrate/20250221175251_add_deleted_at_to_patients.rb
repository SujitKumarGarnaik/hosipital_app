class AddDeletedAtToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :deleted_at, :datetime
  end
end
