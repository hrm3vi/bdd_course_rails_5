require 'rails_helper'

RSpec.feature 'Signup users' do
	scenario 'with valid credentials' do
		visit "/"
		click_link "Sign Up"
		fill_in "Email", with: 'example@test.com'
		fill_in "Password (6 characters minimum)", with: 'password'
		fill_in "Password Confirmation", with: 'password'
		click_button 'Sign Up'
		expect(page).to have_content('You have signed up successfully.')
	end

	scenario 'with invalid credentials' do
		visit "/"
		click_link "Sign Up"
		fill_in "Email", with: ''
		fill_in "Password (6 characters minimum)", with: ''
		fill_in "Password Confirmation", with: ''
		click_button 'Sign Up'
		# expect(page).to have_content('You have not signed up successfully.')
	end

	scenario 'can go to login' do
		visit "/"
		click_link "Sign Up"
		click_link "Click here if you have an account aleady"
		expect(page.current_path).to eq(new_user_session_path)
	end
end