class RoomScraper

    def initialize(index_url)
      @doc = Nokogiri::HTML(open(index_url))
        binding.pry
    end 

    def call 
        rows.each do |row_doc|
            scrape_row(row_doc)
        end 
    end 

   private
    def rows
        @rows || = @doc.css(".result-row")
        # @doc.search("div.content span.rows p.row") --doesn't work
        # @doc.search("span.pl time")
    #   @doc.css(".result-date")  -- works
    end
    
    def scrape_row(row)
        #scrape an individual row
        time = row.search("time")
        title = row.search("a.hdrlnk")
        url = row.search("a.hdrlnk").attr("href")
        
        {
            :title => ""
        }


    end
end 