def enter_test_bookmark
  visit "/"
  click_link("Add Bookmark")
  fill_in('url', with: 'https://www.test-title.com/')
  fill_in('title', with: 'title')
  click_button('Add')
end