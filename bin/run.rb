require_relative '../config/environment'
require_relative '../app/model/character'
require_relative '../app/model/inventory'
require_relative '../app/model/item'


def start
    input=nil
    while input!="exit"
        greeting
        input=gets.chomp
        if input == "1"
            newCharacter=new_character
        elsif input =="2"
            item=generate_new_item
        elsif input =="3"
            
        elsif input =="4"
            delete_character
        elsif input =="5"
            display_characters
        elsif input =="6"
            display_items
        elsif input =="7"
            delete_item
        elsif input =="exit"
            break
        end
    end

end

def greeting
    puts "welcome to Loot Game"
    menu
    puts "What do you want to do?"
end

def delete_character
    if Character.all.count==0
        puts "There is no character to delete!"
    else
    puts "enter a character id that you want to delete"
    char_id=gets.chomp
    Charater.delete(char_id)
    end
end

def delete_item
    if Item.all.count == 0
        puts "there is nothing to delete"
    else
        puts "Please enter an item id to delete:"
            item_id=gets.chomp
            Item.delete(item_id)
    end
end

def new_character
    puts "what is name of the character?"
    char_name=gets.chomp
    Character.create_character(char_name)
end

def display_items
    all_item=Item.all
    all_item.map do |item|
        puts item.inspect
    end
end
def display_characters
    all_character=Character.all
    all_character.map do |char|
        puts char.inspect
    end
end


def menu
    puts "1. create character"
    puts "2. create item"
    puts "3. find item" 
    puts "4. delete character"
    puts "5. show all the characters"
    puts "6. show all the items"
    puts "7. delete item"
    puts "8. change character name"
    puts "9. exit"
end


def generate_new_item
    item_array=[Item.new(name: "sword", category: "Weapon"), 
                Item.new(name: "shield", category: "Shield"),
                Item.new(name: "potion", category: "Potion") ]

    rand_num =rand(1..10)
    if rand_num.to_i % 2 == 1
        item=item_array.sample
        item.save
    else
        puts "no item is created."
        nil
    end
end

start