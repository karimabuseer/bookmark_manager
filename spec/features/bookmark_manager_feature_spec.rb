require_relative '../../app.rb'

RSpec.feature 'Bookmark' do
  scenario 'is expected to have welcome on home page' do
    visit "/"
    expect(page).to have_text("Welcome to Bookmark Manager!")
  end

  scenario 'is expected to enable user to see bookmarks' do
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    visit "/"
    click_link("View Bookmarks")
    expect(page).to have_text('http://www.makersacademy.com')
  end
end