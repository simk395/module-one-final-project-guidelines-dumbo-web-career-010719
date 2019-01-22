class Character < ActiveRecord::Base
    has_many :inventories
    has_many :items, through: :inventory

    def self.create_character(char)
        Character.create(name: char, hp: 50, atk: 10, def: 10)
    end

    def delete_character
        self.destroy(self.id)

    end

    def self.show_characters
        Character.all
    end

    # def update_character(name)
    #     self.update(name: name)
    # end

end
