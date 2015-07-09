class RemoveEarncolumn < ActiveRecord::Migration
  def change
    remove_column :sales, :earn
  end
end
