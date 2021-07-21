require 'pg'

class BookmarkList
  attr_reader :array
  def self.instance
    @BookmarkList ||= BookmarkList.new
  end

  def initialize
    
  end

  def list

    if ENV['RACK_ENV'] == 'test' 
      con = PG.connect :dbname => 'bookmark_manager_test'
      else 
        con = PG.connect :dbname => 'bookmark_manager'
    end
    dbbookmarks = con.exec "SELECT * FROM bookmarks;"
    dbbookmarks.map {|row| row['url']}.join("\n")
  end
end
