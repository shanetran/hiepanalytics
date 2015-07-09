class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :sale_day
      t.float :quantity
      t.float :price
      t.float :capital
      t.float :earn

      t.timestamps
    end
  end
end
