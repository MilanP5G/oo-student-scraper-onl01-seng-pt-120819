require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    
    profiles = [] 
    
    page.css(".student-card"). each do | project |
        name = project.css(".student-name").text,
        location = project.css(".student-location").text,
        profile_url = project.css("a").attribute("href").value
        student_profiles = {
          :name => name,
          :location => location 
          :profile_url => profile_url
        }
    end
    profiles << student_profiles
   end 
    profiles
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

