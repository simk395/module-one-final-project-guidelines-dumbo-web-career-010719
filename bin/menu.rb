require_relative '../config/environment'
require_relative '../app/model/character'
require_relative '../app/model/inventory'
require_relative '../app/model/item'

#character's menu
class Menu
    def self.menu2
        puts
        loop do
          choose do |menu|
            puts "Character Menu"
            menu.prompt = "Pick an option"
            menu.choice("Change character name"){Character.update_character_name()}
            menu.choice("Create Item") { Item.generate_new_item()}#
            menu.choice("Show character inventory") {Inventory.char_inventory()}#can do better
            menu.choice("Delete Character"){Character.delete_char()}
            menu.choice("Delete Item"){Item.delete_item()}
            menu.choice("Go Back") { menu1 }
          end 
        end
    end

    def self.music
        player = Audite.new

        player.load('/Users/tong/dev/module-one-final-project-guidelines-dumbo-web-career-010719/bin/lom.mp3')
        player.start_stream
        player.forward(20)
        player.thread.join
    end

    #main menu
    def self.menu1
        puts
        loop do
            choose do |menu|
                puts "Main Menu"
                menu.prompt = "Pick an option"
                menu.choice("Create Character"){Character.create_character() }
                menu.choice("Select Character") {Character.load()}
                menu.choice(:Quit, "Exit program.") { exit }
            end
        end
    end
end