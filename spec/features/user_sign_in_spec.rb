require 'rails_helper'

 RSpec.feature 'users sign in' do
 	before do
 		@john = User.create!(email: "john@example.com", password: "password")
 	end

 	scenario 'with valid credentials' do
 		visit "/"

 		click_link "log in"
 		fill_in "Email", with: @john.email
 		fill_in "Password", with: @john.password
 		click_button "Log in"

 		expect(page).to have_content("Signed in successfully.")
 		expect(page).to have_content("Signed in as #{@john.email}")
 		expect(page).to have_link("sign out")
 		expect(page).not_to have_link("log in")
 	end
 end