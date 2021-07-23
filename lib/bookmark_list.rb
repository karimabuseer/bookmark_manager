require 'pg'

class Bookmark
  attr_reader :id, :url, :title 

  def initialize(id:, url:, title:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    dbbookmarks = database_connect.exec "SELECT * FROM bookmarks;"
    dbbookmarks.map { |bookmark| Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(title:, url:)
    newbookmark = database_connect.exec "INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, url, title;"
    Bookmark.new(id:newbookmark[0]['id'], url: newbookmark[0]['url'], title: newbookmark[0]['title'])
  end

  def self.delete(id:)
    database_connect.exec("DELETE FROM bookmarks WHERE id=#{id}")
  end
  private 

  def self.database_connect
    ENV['RACK_ENV'] == 'test' ? 
    (PG.connect :dbname => 'bookmark_manager_test') : (PG.connect :dbname => 'bookmark_manager')
  end
end
