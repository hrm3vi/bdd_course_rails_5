require 'rails_helper'

RSpec.feature "creating articles" do

  scenario "a user visits new-article page from index" do
    visit "/"
    click_link "New Article"
    expect(page).to have_content("Create a new article")
    expect(page).to have_css('input#article_title')
    expect(page).to have_css('textarea#article_body')
    expect(page).to have_button('Create Article')
  end

  scenario "a user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem ipsum"
    click_button "Create Article"
    expect(page).to have_content("Article has been created.")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "a user fails to create a new article" do
	visit "/"
    click_link "New Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    expect(page).to have_content("Article has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

end
