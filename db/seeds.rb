# Varities

black_tea = Variety.create(:name => 'Black tea', :description => 'Black tea is a type of tea that is more oxidized than oolong, green and white teas.')
green_tea = Variety.create(:name => 'Green tea', :description => 'Green tea is made from the leaves from Camellia sinensis that have undergone minimal oxidation during processing.')
Variety.create(:name => 'Oolong tea', :description => 'Oolong (simplified Chinese: 乌龙; traditional Chinese: 烏龍; pinyin: wūlóng) is a traditional Chinese tea (Camellia sinensis) produced through a unique process including withering under the strong sun and oxidation before curling and twisting.')
Variety.create(:name => 'White tea', :description => 'White tea is a lightly oxidized tea grown and harvested primarily in China, mostly in the Fujian and Zhejiang province.')

# The Tea Brewery

brewery = Brewery.create(:name => 'The Tea Brewery', :year => 2013)

brewery.teas.create(:name => 'Sencha', :variety => green_tea)
brewery.teas.create(:name => 'Gyokuro', :variety => green_tea)
brewery.teas.create(:name => 'Keemun', :variety => black_tea)

# Japanese Brewery

brewery = Brewery.create(:name => 'Japanese Brewery', :year => 2013)

brewery.teas.create(:name => 'Kabusecha', :variety => green_tea)
brewery.teas.create(:name => 'Gyokuro', :variety => green_tea)

# Chinese Brewery

brewery = Brewery.create(:name => 'Chinese Brewery', :year => 2013)

brewery.teas.create(:name => 'Tanyang Gongfu', :variety => black_tea)
brewery.teas.create(:name => 'Zhenghe Gongfu', :variety => black_tea)

# Japanese Tea Society

TeaClub.create(:name => 'Japanese Tea Society', :founded => 1800, :city => 'Tokyo')
