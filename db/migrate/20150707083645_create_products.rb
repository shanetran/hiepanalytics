class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.date :buy_day
      t.integer :quantity

      t.timestamps
    end
  end
end
