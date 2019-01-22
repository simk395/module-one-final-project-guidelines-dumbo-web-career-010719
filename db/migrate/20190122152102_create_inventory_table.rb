class CreateInventoryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory do |t|
      t.string :item
    end
  end
end
