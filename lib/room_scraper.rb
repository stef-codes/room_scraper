class RoomScraper

    def initialize(index_url)
      @doc = Nokogiri::HTML(open(index_url))
    end 

    def call 
        rows.each do |row_doc|
           room = Room.new_from_hash(scrape_row(row_doc))
            room.save #=> should put the room in my database
        end 
    end 

   private
    def rows
        @rows ||= @doc.css(".result-row")
        # @doc.search("div.content span.rows p.row") --doesn't work
        # @doc.search("span.pl time")
    #   @doc.css(".result-date")  -- works
    end
    
    def scrape_row(row)
        #scrape an individual row
        {
            :date_created => row.search("time").attr("datetime").text,
            :title => row.search("a.hdrlnk").text,
            :url => row.search("a.hdrlnk").attr("href").text,
            :price => row.search("span.price")[0].text
            # css(".result-price")[0].text
            # search("span.result-price")[0].text
        }
    end
end 