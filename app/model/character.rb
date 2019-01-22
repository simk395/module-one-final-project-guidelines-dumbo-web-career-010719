class Character < ActiveRecord::Base
    has_many :inventorys
    has_many :items, through: :inventory

    def create_character(char)
        Character.new(name: char, hp: 50, atk: 10, def: 10)
    end
end
