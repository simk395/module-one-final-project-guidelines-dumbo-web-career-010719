class Item < ActiveRecord::Base
    has_many :inventories
    has_many :characters, through: :inventory

    def view_item
        self.find(self.id)
    end

    def self.show_items
        Item.all
    end

end