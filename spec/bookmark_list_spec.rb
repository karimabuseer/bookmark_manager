require 'bookmark_list'
describe BookmarkList do
  con = PG.connect :dbname => 'bookmark_manager_test'
  it 'has a class method that creates new bookmark' do
    expect(BookmarkList.instance).to be_instance_of(BookmarkList)
  end
  it 'is expected to have list of bookmarks' do
    puts ENV["RACK_ENV"]
    con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com'), ('https://twitter.com/'),('https://www.destroyallsoftware.com')  ")
    expect(subject.list).to eq("http://www.makersacademy.com\nhttps://twitter.com/\nhttps://www.destroyallsoftware.com")
  end


end