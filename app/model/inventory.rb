class Inventory < ActiveRecord::Base
    belongs_to :character
    belongs_to :item

    def delete
        self.delete_all(self.id)
    end

    def self.char_inventory
            # result.each {|item| puts item}
        if Character.current_char!=""
            # char_inv = Inventory.all.where(char_id: Character.current_char.id)
            char_id = Character.current_char.id
            query = <<-SQL 
            select inventories.id, items.name
            from inventories inner join items
            on inventories.item_id = items.id and inventories.char_id = char_id
           SQL

            result = ActiveRecord::Base.connection.execute(query)
            result=result.each {|hash| hash.without("0", "1")}
           
            
            return tp result
            # puts tp char_inv
            # item_name = Item.all
            # result=[]
            # char_inv.map do |inv|
            #     item_name.select do |item|
            #         if inv.item_id == item.id
            #         result<< "#{item.id}: #{item.name}"
            #         end
            #     end 
            # end
            # puts "==============================="
            # if result.count > 0
            #     result.each {|item| puts item}
            # else
            #     puts "No Data!"
            # end
            # puts "==============================="
        end
            puts "No character has been selected."
     end

    def self.show_inventories
        tp Inventory.all
    end
    
    def self.add_item_to_inventory(item)
        question = ask("Would you like to keep this item? (Please enter 1 for YES and 0 for NO)", Integer)#need fix boolean
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