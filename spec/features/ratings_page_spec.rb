require 'spec_helper'

describe 'Ratings page' do

  describe 'when ratings exists' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do

      tea = FactoryGirl.create(:tea)

      @rating = FactoryGirl.create(:rating, :score => 10, :tea => tea, :user => user)
      @rating2 = FactoryGirl.create(:rating, :score => 15, :tea => tea, :user => user)

      visit ratings_path

    end

    it 'should show the ratings' do

      expect(page).to have_content @rating
      expect(page).to have_content @rating2

    end

  end

end
