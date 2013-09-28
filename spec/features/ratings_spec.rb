require 'spec_helper'

describe 'Rating' do

  include TestHelper

  let!(:brewery) { FactoryGirl.create :brewery, :name => 'Japanese Brewery' }
  let!(:tea) { FactoryGirl.create :tea, :name => 'Gyokuro', :brewery => brewery }
  let!(:tea2) { FactoryGirl.create :tea, :name => 'Kabusecha', :brewery => brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do

    log_in('kasper', 'repsak1')

  end

  it 'is registered to the tea and user who is signed in' do

    visit new_rating_path

    select(tea.to_s, :from => 'rating[tea_id]')

    fill_in('rating[score]', :with => '15')

    expect{

      click_button('Create Rating')

    }.to change { Rating.count }.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(tea.ratings.count).to eq(1)
    expect(tea.average_rating).to eq(15.0)

  end

end
