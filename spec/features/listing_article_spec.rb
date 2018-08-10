require 'rails_helper'

RSpec.feature "listing articles" do

	before do
		@article1 = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.")
		@article2 = Article.create(title: "The second article", body: "Body of second article")


	end

  	scenario "a user list all articles" do
  		visit "/"

  		expect(page).to have_content(@article1.title)
  		expect(page).to have_content(@article1.body)
  		expect(page).to have_content(@article2.title)
  		expect(page).to have_content(@article2.body)
  		expect(page).to link(@article1.title)
  		expect(page).to link(@article2.title)
  		


  	end
end
