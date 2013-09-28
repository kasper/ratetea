module TestHelper

  def log_in(username, password)

    visit login_path

    fill_in('username', :with => username)
    fill_in('password', :with => password)

    click_button('Login')

  end

end
