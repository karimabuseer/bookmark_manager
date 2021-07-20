require 'bookmark_list'
describe BookmarkList do
  it 'has a class method that creates new bookmark' do
    expect(BookmarkList.instance).to be_instance_of(BookmarkList)
  end
  it 'is expected to have list of bookmarks' do
    expect(subject.list).to eq("http://www.makersacademy.com\nhttps://twitter.com/\nhttps://www.destroyallsoftware.com")
  end
end