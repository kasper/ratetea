require 'spec_helper'

describe Brewery do

  it 'without a name is not valid' do

    brewery = Brewery.create(:year => 1800)

    expect(brewery).not_to be_valid

  end

  it 'has the name and year set correctly and is saved' do

    brewery = Brewery.create(:name => 'Japanese Brewery', :year => 1800)

    expect(brewery.name).to eq('Japanese Brewery')
    expect(brewery.year).to eq(1800)
    expect(brewery).to be_valid

  end

end
