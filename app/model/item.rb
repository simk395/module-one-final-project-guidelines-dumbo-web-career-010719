class Item < ActiveRecord::Base
    has_many :inventorys
    has_many :characters, through: :inventory
end