require 'rails_helper'

RSpec.feature "deleting an article" do
	
	before do
		john = User.create(email: 'john@example.com', password: 'pasword')
		login_as(john)
		@article = Article.create(title: "Title One", body: "Body of Article One", user: john)
	end

	scenario "a user deletes an article" do
		visit "/"

		click_link @article.title
    	find("a#delete-article").click

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end


end