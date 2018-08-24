require 'rails_helper'

RSpec.feature 'signing out a signed-in user' do
	before do
		@john = User.create(email: 'john@example.com', password: 'password')
		visit '/'
		click_link "Log In"
 		fill_in "Email", with: @john.email
 		fill_in "Password", with: @john.password
 		click_button "Log In"
	end

	scenario 'user can sign out' do
		visit '/'
		click_link 'Sign Out'
		expect(page).to have_content('Signed out successfully.')
		expect(page).not_to have_link('Sign Out')
	end





end