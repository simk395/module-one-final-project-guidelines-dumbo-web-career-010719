require_relative '../config/environment'
require_relative '../app/model/character'
require_relative '../app/model/inventory'
require_relative '../app/model/item'
require_relative './menu'
require 'audite'

begin
    t1 = Thread.new do
        Menu.menu1
    end
    Menu.music
    t1.join
end