
class Character < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventory

    @@current_char = ""

    #create a new character along with 5 free inventory slots associate with
    def self.create_character
        char_name = ask("Character Name?", String)
        new_char = Character.create(name: char_name)
        5.times do
            Inventory.create(char_id: new_char.id)
        end
        puts "You have created #{new_char.name}!"
        Menu.menu2
    end
    
    #return all characters
    def self.show_characters
        tp Character.all
    end

    #update a character's name
    def self.update_character_name
    if Character.current_char != ""
        new_name = ask("Choose a name to change to: ", String)
        char_id = Character.current_char.id
        char = Character.find(char_id)
        char.update(name: new_name)
        puts "Your name is now #{char.name}!"
    else
        puts "No character has been selected."
    end
    end
    
    #load a existing character
    def self.load
    if Character.all.count != 0
        Character.show_characters
        q = ask("Choose character: (Please enter character id number)", Integer)
        @@current_char = Character.find_by(id: q)
        puts "You've selected #{@@current_char.name}!"
        Menu.menu2
    else
        puts "There are no characters to select."
    end
    end

    #return a current character object
    def self.current_char
    @@current_char
    end

    #delete a character along with the inventory associate with 
    def self.delete_char
        if Character.current_char != ""
            Inventory.where(char_id: Character.current_char.id).destroy_all
            Character.destroy(Character.current_char.id)
        else
            puts "No character has been selected."
        end
    end
end
