require 'pg'

class BookmarkList
  attr_reader :array
  def self.instance
    @BookmarkList ||= BookmarkList.new
  end

  def initialize
    
  end

  def list
    con = PG.connect :dbname => 'bookmark_manager'
    dbbookmarks = con.exec "SELECT * FROM bookmarks;"
    dbbookmarks.map {|row|
      row['url']}.join("\n")

  end

end