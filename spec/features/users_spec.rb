require 'spec_helper'

describe 'User' do

  include TestHelper

  before :each do

    FactoryGirl.create :user

  end

  it 'when signed up with good credentials, it is added to the system' do

    visit signup_path

    fill_in('user_username', :with => 'jack')
    fill_in('user_password', :with => 'secret44')
    fill_in('user_password_confirmation', :with => 'secret44')

    expect {

      click_button('Create User')

    }.to change{User.count}.by(1)

  end

  describe 'who has signed up' do

    it 'can sign in with right credentials' do

      log_in('kasper', 'repsak1')

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'kasper'

    end

    it 'is redirected back to sign in form if wrong credentials are given' do

      log_in('kasper', 'wrong')

      expect(current_path).to eq(login_path)
      expect(page).to have_content 'Username or password do not match.'

    end

  end

end
