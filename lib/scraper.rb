require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    
    profiles = [] 
    
    page.css(".roster-body-wrapper"). each do | project |
      title = project.css(".roster-cards-container").text 
      profiles[title.to_sym] = {
        name = project.css(".student-name").text,
        location = project.css(".student-location").text,
        profile_url = project.css("a").attribute("href").value
      }
    end 
    profiles
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

