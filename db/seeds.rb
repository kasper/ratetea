# The Tea Brewery

brewery = Brewery.create(:name => 'The Tea Brewery', :year => 2013)

brewery.teas.create(:name => 'Sencha', :variety => 'Green Tea')
brewery.teas.create(:name => 'Gyokuro', :variety => 'Green Tea')
brewery.teas.create(:name => 'Keemun', :variety => 'Black Tea')

# Japanese Brewery

brewery = Brewery.create(:name => 'Japanese Brewery', :year => 2013)

brewery.teas.create(:name => 'Kabusecha', :variety => 'Green Tea')
brewery.teas.create(:name => 'Gyokuro', :variety => 'Green Tea')

# Chinese Brewery

brewery = Brewery.create(:name => 'Chinese Brewery', :year => 2013)

brewery.teas.create(:name => 'Tanyang Gongfu', :variety => 'Black Tea')
brewery.teas.create(:name => 'Zhenghe Gongfu', :variety => 'Black Tea')
