require_relative '../../app.rb'
require_relative './web_helper.rb'

RSpec.feature 'Bookmark' do
  scenario 'is expected to have welcome on home page' do
    visit "/"
    expect(page).to have_text("Welcome to Bookmark Manager!")   
  end

  scenario 'is expected to enable user to see existing bookmark links' do
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec("INSERT INTO bookmarks (title, url) VALUES ('test', 'test.com');")
    visit "/bookmarks"
    expect(page).to have_link('test', href: 'test.com')
  end

  scenario 'is expected to be able to add bookmark' do
    visit "/"
    enter_test_bookmark
    expect(page).to have_link('title', href: 'https://www.test-title.com/')
  end

  scenario 'is expected to be able to delete a bookmark' do
    enter_test_bookmark
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('test', href: 'test.com') 
  end
end