require_relative './config/environment'


def reload! 
   load_all './lib'
end 

task :console do
    Pry.start
end

task :scrape_rooms do 
    #instantiate a scraper and have it find new rooms 
    nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo').update_rooms
    # nyc_scraper.call
    # chicago_scraper = RoomScraper.new(https://chicago.craigslist.org/search/roo).update_rooms
    # chicago_scraper.call
    #after this method call I should be able to say Room.all and have rooms there
end 