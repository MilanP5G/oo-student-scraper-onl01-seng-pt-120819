require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    
    profiles = [] 
    
    page.css(".student-card"). each do | profile |
        name = profile.css(".student-name").text
        location = profile.css(".student-location").text
        profile_url = profile.css("a").attribute("href").value
        student_profiles = {
          :name => name,
          :location => location,
          :profile_url => profile_url
        }
        profiles << student_profiles
    end
    profiles
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    
    profile_pages = {}
    
    social = page.css(".social_icon_container").collect { | icon | icon.attribute("href").value }
    social.each do | link | 
    if link.include?("twitter")
        profile_pages[:twitter] = link
      elsif link.include?("linkedin")
        profile_pages[:linkedin] = link
      elsif link.include?("github")
        profile_pages[:github]= link
      elsif link.include?(".com")
        profile_pages[:blog] = link
      end 
    end 
      students[:profile_quote] = page.css(".profile-quote").text
       students[:bio] = page.css("div.description-holder p").text
    students
  end 
      
    


end

