require 'spec_helper'

describe Tea do

  it 'should not be saved without a name' do

    tea = Tea.create

    expect(tea.valid?).to be(false)
    expect(Tea.count).to eq(0)

  end

  it 'should not be saved without a style' do

    tea = Tea.create(:name => 'Sencha')

    expect(tea.valid?).to be(false)
    expect(Tea.count).to eq(0)

  end

end
