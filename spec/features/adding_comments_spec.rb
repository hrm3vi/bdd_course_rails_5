require 'rails_helper'

RSpec.feature 'adding reviews to articles' do
	before do
		@john = User.create(email: 'john@example.com', password: 'pasword')
		@chela = User.create(email: 'chela@example.com', password: 'password')
		@article = Article.create(title: 'The first article', body: 'Lorem ipsum lalala', user: @john)
	end

	scenario 'permits a signed-in user to write a comment' do
		login_as(@chela)
		visit '/'
		click_link @article.title
		fill_in "New Comment", with: 'Amazing comment'
		click_button "Add Comment"
		expect(page).to have_content("Comment has been created")
		expect(page).to have_content("Amazing comment")
		expect(current_path).to eq article_path(@article.id)
	end
end