class ChangeTypedataProduct < ActiveRecord::Migration
  def change
    change_column :products, :quantity, :float
    change_column :products, :price, :float
  end
end
