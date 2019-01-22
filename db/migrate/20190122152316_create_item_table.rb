class CreateItemTable < ActiveRecord::Migration[5.0]
  def change
    create_table :item do |t|
      t.string :name
      t.string :type
      t.integer :hp
      t.integer :atk
      t.integer :def
    end
  end
end
