require 'rubygems'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'iconv'

module ApplicationHelper


class GameRequest

  def self.get_games(url)
    #get exceptions later
    final_result = []
    #doc = Nokogiri::HTML(Iconv.conv('utf-8//IGNORE', 'ISO-8859-1', open(url).read))
    doc = Nokogiri::HTML(open(url))

    games_array = doc.xpath('//td[@class="txtdezena"]')

    games_array.each do |line|
      line.content.gsub(/\S+\w+\S+/, '-').split('-').each do |element|
        final_result << element.strip()
      end
    end
    final_result
  end
end
end
