class Character < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventory

    def self.create_character(char)
        Character.create(name: char)
    end

    def delete_character
        self.destroy(self.id)

    end

    def self.show_characters
        Character.all
    end

     def self.update_character_name(chara_id , new_name)
        char=Character.find(chara_id)
        char.update(name: new_name)
        puts char.inspect
     end

     def self.add_item
        
     end

end
