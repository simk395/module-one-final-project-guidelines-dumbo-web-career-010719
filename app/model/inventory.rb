class Inventory < ActiveRecord::Base
    belongs_to :character
    belongs_to :item

    def delete
        self.delete_all(self.id)
    end

    def self.show_inventories
        Inventory.all
    end

    def self.find_item(item_id)
        Inventory.all.collect do |inv|
            inv.item_id = item_id
        end
    end

    def self.add_inventory(char, item)
        inv=Inventory.create()
        inv.character=char
        char.inventories<<inv
        item.inventories<<inv
    end
    
#     hotline_bling = Song.create(:name=>'Hotline Bling')
# thriller = Song.create(:name=>'Thriller')

# drake = Artist.create(:name=>'Drake')
# mj = Artist.create(:name=>'Michael Jackson')

# rap = Genre.create(:name=>'Rap')
# pop = Genre.create(:name=>'Pop')

# hotline_bling.artist = drake
# thriller.artist = mj

# drake.songs << hotline_bling
# mj.songs << thriller

# pop.songs << thriller
# rap.songs << hotline_bling

end