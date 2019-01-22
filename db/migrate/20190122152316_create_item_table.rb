class CreateItemTable < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :hp
      t.integer :atk
      t.integer :def
    end
  end
end
