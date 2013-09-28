require 'spec_helper'

describe 'User page' do

  include TestHelper

  describe 'when ratings exists' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do

      tea = FactoryGirl.create(:tea, :name => 'Kabusecha', :variety => 'Black tea')

      @rating = FactoryGirl.create(:rating, :score => 10, :tea => tea, :user => user)
      @rating2 = FactoryGirl.create(:rating, :score => 15, :tea => tea, :user => user)

      log_in('kasper', 'repsak1')
      visit user_path(user)

    end

    it 'should show the ratings' do

      expect(page).to have_content @rating
      expect(page).to have_content @rating2

    end

    it 'when user destroys rating, it is removed' do

      expect {

        click_link('Destroy', :href => '/ratings/1')

      }.to change { Rating.count }.by(-1)

    end

    it 'should show favourite tea' do

      expect(page).to have_content 'Favourite tea'
      expect(page).to have_content 'Kabusecha'

    end

    it 'should show favourite variety' do

      expect(page).to have_content 'Favourite variety'
      expect(page).to have_content 'Black tea'

    end

    it 'should show favourite brewery' do

      expect(page).to have_content 'Favourite brewery'
      expect(page).to have_content 'The Tea Brewery'

    end

  end

end
