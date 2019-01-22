class Inventory < ActiveRecord::Base
    belongs_to :character
    belongs_to :item

    def delete
        self.delete_all(self.id)
    end

    def self.show_inventory
        Inventory.all
    end

    # def find_item()
    #     Inventory.all collect do |inv|
            
    #     end

    # end

end