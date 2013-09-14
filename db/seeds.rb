# The Tea Brewery

brewery = Brewery.create(:name => 'The Tea Brewery', :year => 2013)

brewery.teas.create(:name => 'Sencha', :variety => 'Green tea')
brewery.teas.create(:name => 'Gyokuro', :variety => 'Green tea')
brewery.teas.create(:name => 'Keemun', :variety => 'Black tea')

# Japanese Brewery

brewery = Brewery.create(:name => 'Japanese Brewery', :year => 2013)

brewery.teas.create(:name => 'Kabusecha', :variety => 'Green tea')
brewery.teas.create(:name => 'Gyokuro', :variety => 'Green tea')

# Chinese Brewery

brewery = Brewery.create(:name => 'Chinese Brewery', :year => 2013)

brewery.teas.create(:name => 'Tanyang Gongfu', :variety => 'Black tea')
brewery.teas.create(:name => 'Zhenghe Gongfu', :variety => 'Black tea')
