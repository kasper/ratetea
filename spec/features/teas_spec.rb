require 'spec_helper'

describe 'Tea' do

  include TestHelper

  let!(:user) { FactoryGirl.create :user }
  let!(:variety) { FactoryGirl.create :variety }
  let!(:brewery) { FactoryGirl.create :brewery, :name => 'Japanese Brewery' }

  it 'can be added' do

    log_in('kasper', 'repsak1')

    visit new_tea_path

    fill_in('tea_name', :with => 'Gyokuro')

    expect {

      click_button('Create Tea')

    }.to change { Tea.count }.by(1)

  end

end
