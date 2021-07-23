require 'bookmark_list'
describe Bookmark do
  let(:con) { PG.connect :dbname => 'bookmark_manager_test' } 
  
  describe '#.create' do
    it 'is expected to have list of bookmarks' do
      testbookmark = Bookmark.create( url: 'test.com', title: 'test')
      result = con.query("SELECT * FROM bookmarks WHERE id = #{testbookmark.id};")[0]
      expect(testbookmark.title).to eq("test")
      expect(testbookmark.url).to eq("test.com")
      expect(testbookmark.id).to eq(result['id'])
    end
  end

  describe '#.all' do
    it 'is expected to have list of bookmarks' do
      Bookmark.create( url: 'test.com', title: 'test')
      Bookmark.create( url: 'test1.com', title: 'test1')
      annoyingbookmark = Bookmark.create( url: 'test2.com', title: 'test2')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks[1].url).to eq("test1.com")
      expect(bookmarks.first.title).to eq('test')
      expect(bookmarks[2].id).to eq(annoyingbookmark.id)
    end
  end

  describe '#.delete' do
    it 'is expected to delete entries succesfully' do
      testbookmark = Bookmark.create( url: 'test.com', title: 'test')
      Bookmark.delete(id: testbookmark.id)
      expect(Bookmark.all[0]).to eq nil
    end
  end
end