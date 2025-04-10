class ChangeStatusToIntegerInAppointments < ActiveRecord::Migration[8.0]
  def up
    # Step 1: Remove default constraint
    change_column_default :appointments, :status, nil

    # Step 2: Change column type
    execute <<-SQL
      ALTER TABLE appointments
      ALTER COLUMN status TYPE INTEGER USING CASE 
        WHEN status = 'scheduled' THEN 0
        WHEN status = 'completed' THEN 1
        WHEN status = 'cancelled' THEN 2
        ELSE 0
      END::integer;
    SQL

    # Step 3: Set new default
    change_column_default :appointments, :status, 0
  end

  def down
    # Reverse the process to convert back to string
    change_column_default :appointments, nil

    execute <<-SQL
      ALTER TABLE appointments
      ALTER COLUMN status TYPE VARCHAR USING 
        CASE 
          WHEN status = 0 THEN 'scheduled'
          WHEN status = 1 THEN 'completed'
          WHEN status = 2 THEN 'cancelled'
          ELSE 'scheduled'
        END;
    SQL

    change_column_default :appointments, 'scheduled'
  end
end
