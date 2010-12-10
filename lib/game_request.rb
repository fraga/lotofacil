require 'rubygems'
require 'nokogiri'
require 'net/http'
require 'open-uri'

class GameRequest

  def initialize
    facil = 'test'
  end

  def self.get_games(url)
    #get exceptions later
    final_result = []
    doc = Nokogiri::HTML(open(url))

    games_array = doc.xpath('//td[@class="txtdezena"]')

    games_array.each do |line|
      line.content.gsub(/\ \W+/, '-').split('-').each do |elements|
        final_result << elements
      end
    end
    final_result
  end
end