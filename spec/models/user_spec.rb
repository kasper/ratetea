require 'spec_helper'

def create_tea_with_ratings(*scores, user)

  tea = FactoryGirl.create(:tea)

  scores.each do |score|

    FactoryGirl.create(:rating, :score => score, :tea => tea, :user => user)

  end

  tea

end

def create_tea_with_rating(score, user)

  create_tea_with_ratings(score, user)

end

def create_teas_with_varieties_and_ratings(names, varieties, scores, user)

  brewery = FactoryGirl.create(:brewery)

  names.each_with_index do |name, index|

    variety = Variety.find_by_name(varieties[index])
    variety = FactoryGirl.create(:variety, :name => varieties[index]) if variety.nil?

    tea = FactoryGirl.create(:tea, :name => name, :variety => variety, :brewery => brewery)
    FactoryGirl.create(:rating, :score => scores[index], :tea => tea, :user => user)

  end

end

def create_teas_with_varieties_breweries_and_ratings(names, varieties, breweries, scores, user)

  names.each_with_index do |name, index|

    brewery = FactoryGirl.create(:brewery, :name => breweries[index])

    variety = Variety.find_by_name(varieties[index])
    variety = FactoryGirl.create(:variety, :name => varieties[index]) if variety.nil?

    tea = FactoryGirl.create(:tea, :name => name, :variety => variety, :brewery => brewery)
    FactoryGirl.create(:rating, :score => scores[index], :tea => tea, :user => user)

  end

end

describe User do

  it 'has the username set correctly' do

    user = User.new(:username => 'Kasper')

    user.username.should == 'Kasper'

  end

  it 'should not be saved without a password' do

    user = User.create(:username => 'Kasper')

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)

  end

  it 'should not save a password under 3 characters' do

    user = User.create(:username => 'Kasper', :password => 're', :password_confirmation => 're')

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)

  end

  it 'should not be saved with a password containing only letters' do

    user = User.create(:username => 'Kasper', :password => 'repsak', :password_confirmation => 'repsak')

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)

  end

  describe 'with a proper password' do

    let(:user) { FactoryGirl.create(:user) }

    it 'is saved' do

      expect(user.valid?).to eq(true)
      expect(User.count).to eq(1)

    end

    it 'and with two ratings, has the correct average rating' do

      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)

    end

  end

  describe 'favourite tea' do

    let(:user) { FactoryGirl.create(:user) }

    it 'has method for determining one' do

      user.should respond_to :favourite_tea

    end

    it 'without ratings does not have one' do

      expect(user.favourite_tea).to eq(nil)

    end

    it 'is the only rated if only one rating' do

      tea = FactoryGirl.create(:tea)
      FactoryGirl.create(:rating, :tea => tea, :user => user)

      expect(user.favourite_tea).to eq(tea)

    end

    it 'is the one with highest rating if several rated' do

      create_tea_with_ratings(10, 20, 15, 7, 9, user)
      best = create_tea_with_rating(25, user)

      expect(user.favourite_tea).to eq(best)

    end

  end

  describe 'favourite tea variety' do

    let(:user) { FactoryGirl.create(:user) }

    it 'has method for determining one' do

      user.should respond_to :favourite_variety

    end

    it 'without ratings does not have one' do

      expect(user.favourite_variety).to eq(nil)

    end

    it 'is the only variety if only one rating' do

      tea = FactoryGirl.create(:tea)
      FactoryGirl.create(:rating, :tea => tea, :user => user)

      expect(user.favourite_variety.name).to eq('Green tea')

    end

    it 'is the one with highest rating if several rated' do

      create_teas_with_varieties_and_ratings([ 'Kabusecha', 'Keemun', 'Gyokuro' ],
                                             [ 'Green tea', 'Black tea', 'Green tea' ],
                                             [ 10, 40, 15 ],
                                             user)

      expect(user.favourite_variety.name).to eq('Black tea')

    end

  end

  describe 'favourite tea brewery' do

    let(:user) { FactoryGirl.create(:user) }

    it 'has method for determining one' do

      user.should respond_to :favourite_brewery

    end

    it 'without ratings does not have one' do

      expect(user.favourite_brewery).to eq(nil)

    end

    it 'is the only brewery if only one rating' do

      tea = FactoryGirl.create(:tea)
      FactoryGirl.create(:rating, :tea => tea, :user => user)

      expect(user.favourite_brewery).to eq(tea.brewery)

    end

    it 'is the one with highest rating if several rated' do

      create_teas_with_varieties_breweries_and_ratings([ 'Kabusecha', 'Keemun', 'Gyokuro' ],
                                                       [ 'Green tea', 'Black tea', 'Green tea' ],
                                                       [ 'The Tea Brewery', 'Japanese Brewery', 'Chinese Brewery' ],
                                                       [ 10, 40, 15 ],
                                                       user)

      best = Brewery.find_by_name('Japanese Brewery')

      expect(user.favourite_brewery).to eq(best)

    end

  end

end
