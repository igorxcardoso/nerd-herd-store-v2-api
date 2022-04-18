class FixContentColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :contents, :type, :media_type
    # rename_column :table_name, :old_column, :new_column
  end
end
