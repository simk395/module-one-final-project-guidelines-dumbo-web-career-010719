class Inventory < ActiveRecord::Base
    belongs_to :character
    belongs_to :item

    def delete
        self.delete_all(self.id)
    end

    def self.char_inventory###
        char_inv = Inventory.all.where(char_id: Character.current_char.id)
        item_name = Item.all
        result=[]
        char_inv.map do |inv|
            item_name.select do |item|
                if inv.item_id == item.id
                   result<< "#{item.id}: #{item.name}"
                end
            end 
        end
        return result
    end
    
    def self.add_item_to_inventory(item)
        question = ask("Would you like to keep this item?", Integer)#need fix boolean
        if question == 1
            character = Character.current_char
            inv = Inventory.where(char_id: character.id)
            tp inv 
            question3 = ask("Which slot would you like to put it in?", Integer)
            inv.where(id: question3).update(item_id: item.id)
        elsif question == 0
            #nothin happens
        else
            puts "Invalid input"
            Inventory.add_item_to_inventory(item)
        end
    end
end