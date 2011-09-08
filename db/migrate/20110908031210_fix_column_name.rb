class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :blocks, :type, :block_type
  end

  def down
    rename_column :blocks, :block_type, :type
  end
end
