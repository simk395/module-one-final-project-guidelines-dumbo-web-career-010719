class Inventory < ActiveRecord::Base
    belongs_to :character
    belongs_to :item

    
    def delete
        self.delete_all(self.id)
    end

    #return a character's inventory
    def self.char_inventory
           
        if Character.current_char!=""
           
            chara_id = Character.current_char.id

            char_inv=Inventory.all.select {|inv| inv.char_id == chara_id}
            # tp char_inv
            
            array=[]
             char_inv.map do |inv|
                Item.all.select do |item|
                    if item.id == inv.item_id
                      hash={ "id"=> item.id,
                            "item"=> item.name}
                      array<<hash
                    end
                end
            end
            return tp array

        #     query = <<-SQL 
        #     select inventories.id "inv_id", items.name "item_name"
        #     from inventories inner join items
        #     on inventories.item_id = items.id and inventories.char_id = char_id
        #    SQL

        #     result = ActiveRecord::Base.connection.execute(query)
        #      puts result
            # result=result.each {|hash| hash.without(0)}
           
            
            # return tp result
        end
            puts "No character has been selected."
     end

    #show all the inventories
    def self.show_inventories
        tp Inventory.all
    end
    
    #add an item to a character's inventory
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