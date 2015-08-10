require 'rails_helper'

feature 'User' do
  
  let(:user){create(:user)}

  context "can login" do
    before do 
      visit root_path
    end

    scenario "visitor see login link" do
      click_link "Login"
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
    end

    scenario "when login redirected to user_path" do
      click_link "Login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      expect(page).to have_content "Brand"
      expect(page).to have_content "Year"
      expect(page).to have_content "When I Bought It"
    end
  end

  context "can work with shoes" do
    before do 
      visit new_user_shoe_path
    end
    scenario "when the user creates a new pair of shoes, they are redirected to their user_path" do
      click_link "Submit"
      expect(page).to have_content "New shoes, my favorite!"    
    end
  end
end