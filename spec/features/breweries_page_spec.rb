require 'spec_helper'

describe 'Breweries page' do

  it 'should not have any breweries when none exist' do

    visit breweries_path

    expect(page).to have_content 'Listing breweries'
    expect(page).to have_content 'Number of breweries: 0'

  end

  describe 'when breweries exists' do

    before :each do

      @breweries = [ 'The Tea Brewery', 'Japanese Brewery', 'Chinese Brewery' ]
      year = 1800

      @breweries.each do |brewery|

        FactoryGirl.create(:brewery, :name => brewery, :year => year += 1)

      end

      visit breweries_path

    end

    it 'lists the existing breweries and their total number' do

      expect(page).to have_content "Number of breweries: #{@breweries.count}"

      @breweries.each do |brewery|

        expect(page).to have_content brewery

      end

    end

    it 'allows user to navigate to page of a Brewery' do

      click_link 'The Tea Brewery'

      expect(page).to have_content 'The Tea Brewery'
      expect(page).to have_content 'Established in 1801'

    end

  end

end
