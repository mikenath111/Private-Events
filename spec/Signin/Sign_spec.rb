require 'rails_helper'

RSpec.describe "GET '/signin'", :type => :feature do
    it 'Shows the sign in form' do
      visit('signin')
      expect(page).to have_content("Email")
      puts 'Log in'
    end
end

RSpec.describe "the signin process", type: :feature do
    before :each  do
        User.create(name: 'MarioDena', email: 'testbot@gmail.com', password: 'password')
    end

    it "Sign in when correct credentials" do
      visit 'signin'
      find('#signin-email').fill_in('session_email', with: 'testbot@gmail.com')
      sleep(5)
      click_button 'Log in'
      sleep(5)
      expect(page).to have_content 'Hi MarioDena !'
    end
end