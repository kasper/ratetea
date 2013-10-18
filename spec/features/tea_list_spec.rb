require 'spec_helper'

describe 'Tea list page' do

  before :all do

    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(:allow_localhost => true)

  end

  before :each do

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start

    @brewery = FactoryGirl.create(:brewery, :name => 'Japanese Brewery')
    @brewery2 = FactoryGirl.create(:brewery, :name => 'The Tea Brewery')
    @brewery3 = FactoryGirl.create(:brewery, :name => 'Chinese Brewery')

    @style = Variety.create(:name => 'Green tea')
    @style2 = Variety.create(:name=> 'Black tea')

    @tea = FactoryGirl.create(:tea, :name => 'Gyokuro', :brewery => @brewery, :variety => @style)
    @tea2 = FactoryGirl.create(:tea, :name => 'Kabusecha', :brewery => @brewery2, :variety => @style)
    @beer3 = FactoryGirl.create(:tea, :name => 'Sencha', :brewery => @brewery3, :variety => @style2)

  end

  after :each do

    DatabaseCleaner.clean

  end

  after :all do

    self.use_transactional_fixtures = true

  end

  it 'shows one known tea', :js => true do

    visit tealist_path

    expect(page).to have_content 'Sencha'

  end

  it 'should by default sort teas by name', :js => true do

    visit tealist_path

    find('table').find('tbody tr:nth-child(1)').should have_content('Gyokuro')
    find('table').find('tbody tr:nth-child(2)').should have_content('Kabusecha')
    find('table').find('tbody tr:nth-child(3)').should have_content('Sencha')

  end

  it 'should sort teas by variety', :js => true do

    visit tealist_path

    click_link('Variety')

    find('table').find('tbody tr:nth-child(1)').should have_content('Black tea')
    find('table').find('tbody tr:nth-child(2)').should have_content('Green tea')
    find('table').find('tbody tr:nth-child(3)').should have_content('Green tea')

  end

  it 'should sort teas by brewery', :js => true do

    visit tealist_path

    click_link('Brewery')

    find('table').find('tbody tr:nth-child(1)').should have_content('Chinese Brewery')
    find('table').find('tbody tr:nth-child(2)').should have_content('Japanese Brewery')
    find('table').find('tbody tr:nth-child(3)').should have_content('The Tea Brewery')

  end

end
