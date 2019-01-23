require "rubygems"
require "highline/import"

@C = 299792458

def accel_calc
  mass = ask("Mass? ", Float)
  speed = ask("Speed? ", Float)
  puts
  puts("mass * speed = #{mass*speed}")
  puts
end

def energy_calc
  mass = ask("Mass? ", Float)
  puts
  puts("E=MC^2 gives #{mass*@C**2}")
  puts
end
begin
    puts
    loop do
      choose do |menu|
        menu.prompt = "Pick an option "
        menu.choice("Create Character") { accel_calc() }
        menu.choice("Create Item") { energy_calc() }
        menu.choice("Show character inventory")
        menu.choice("Show character items")
        menu.choice("Change character name")
        menu.choice("Delete Character")
        menu.choice("Delete Item")
        menu.choice("Delete Inventory")
        menu.choice(:Quit, "Exit program.") { exit }
      end
    end
end