require 'spec_helper'

describe 'Places' do

  it 'if none are returned by the API, a notice is shown on the page' do

    TeamappingAPI.stub(:places_in).with('vantaa').and_return([])

    visit places_path

    fill_in('city', :with => 'vantaa')
    click_button 'Search'

    expect(page).to have_content 'No locations in Vantaa.'

  end

  it 'if one is returned by the API, it is shown on the page' do

    TeamappingAPI.stub(:places_in).with('kumpula').and_return([ Place.new(:name => 'Oljenkorsi') ])

    visit places_path

    fill_in('city', :with => 'kumpula')
    click_button 'Search'

    expect(page).to have_content 'Oljenkorsi'

  end

  it 'if more than one is returned by the API, they are shown on the page' do

    TeamappingAPI.stub(:places_in).with('helsinki').and_return([ Place.new(:name => 'Oljenkorsi'), Place.new(:name => 'Kaisla') ])

    visit places_path

    fill_in('city', :with => 'helsinki')
    click_button 'Search'

    expect(page).to have_content 'Oljenkorsi'
    expect(page).to have_content 'Kaisla'

  end

end
