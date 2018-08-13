require 'rails_helper'

RSpec.feature "Deleting an Article" do
	
	before do
		@article = Article.create(title: "Title One", body: "Body of Article One")
	end

	scenario "a user deletes an article" do
		visit "/"

		click_link @article.title
    	find("a#delete-article").click

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end


end