require_relative '../config/environment'
require_relative '../app/model/character'
require_relative '../app/model/inventory'
require_relative '../app/model/item'


def start
    input=nil
    puts "welcome to Loot Inventory"
    while input!="exit"
        greeting
        input=gets.chomp
        if input == "1"
            up
            newCharacter=new_character
            down
        elsif input =="2"
            up
            item=generate_new_item
            down
        elsif input =="3"
            
        elsif input =="4"
            up
            delete_character
            down
        elsif input =="5"
            up
            display_characters
            down
        elsif input =="6"
            up
            display_items
            down
        elsif input =="7"
            up
            delete_item
            down
        elsif input =="8"
            up
            update_character
            down
        elsif input =="exit" || input == "9"
            break
        end
    end
end

def up
    puts "================================================================================================="
end

def down
    puts "================================================================================================="
end

def update_character
    puts "Enter the character id you want to change the name:"
    char_id=gets.chomp
    puts "Enter a new name for the character: "
    new_name=gets.chomp
    Character.update_character_name(char_id.to_i, new_name)
end

def greeting
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
    char=Character.create_character(char_name)
    puts char.inspect
end

def display_items
    all_item=Item.show_items
    all_item.map do |item|
        puts item.inspect
    end
end
def display_characters
    all_character=Character.show_characters
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
        puts item.inspect
    else
        puts "no item is created. Try again!"
        nil
    end
end

start