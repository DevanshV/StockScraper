require 'rubygems'
require 'mechanize'
# require "nokugiri"

keywords = ['pharmaceuticals stocks','FDA', 'approval', 'stock', 'popular stock', 'tse', 'nasdaq']

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://news.google.com/') do |page|
  keywords.each do |searchterm|

    search_result = page.form_with(:name => 'gbqf') do |search| # 3
      search.q = searchterm
    end.submit

#      puts "-- NASDAQ --" + " Google was searched for" + searchterm
    search_result.body.to_s.scan(/NASDAQ:\W?(.*?)\W/).each do |ticker|
        puts ticker
    end
    search_result.body.to_s.scan(/Nasdaq:\W?(.*?)\W/).each do |ticker|
        puts ticker
    end
    search_result.body.to_s.scan(/NYSE:\W?(.*?)\W/).each do |ticker|
        puts ticker
    end
    search_result.body.to_s.scan(/nyse:\W?(.*?)\W/).each do |ticker|
        puts ticker
    end
    search_result.body.to_s.scan(/b>:(.{1,10})\)/).each do |ticker|
        puts ticker
    end

#    search_result.body.to_s.scan(/\W(.{1,20})\sPharmaceuticals/).each do |ticker|
#        puts ticker
#    end

  end
end 