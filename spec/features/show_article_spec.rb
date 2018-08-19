require "rails_helper"

RSpec.feature "Showing an article" do 

	before do
		@john = User.create(email: 'john@example.com', password: 'pasword')
		@chela = User.create(email: 'chela@example.com', password: 'password')
		@article = Article.create(title: 'The first article', body: 'Lorem ipsum lalala', user: @john)
	end

	scenario "to non-signed-in users, hide edit and delete buttons" do
		visit "/"
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).not_to have_css("#edit-article")
		expect(page).not_to have_css("#delete-article")
	end

	scenario "to non-owner, hide edit and delete buttons" do
		login_as(@chela)
		visit "/"
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).not_to have_css("#edit-article")
		expect(page).not_to have_css("#delete-article")
	end

	scenario "signed-in owner, sees edit and delete buttons" do
		login_as(@john)
		visit "/"
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).to have_css("#edit-article")
		expect(page).to have_css("#delete-article")
	end



end