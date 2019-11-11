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
        {
            :date_created => row.search("time").attr("datetime").text,
            :title => row.search("a.hdrlnk").text,
            :url => row.search("a.hdrlnk").attr("href").text,
            :price => row.css(".result-price").text
        }
    end
end 