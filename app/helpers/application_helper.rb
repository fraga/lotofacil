require 'rubygems'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'zip/zip'
require 'iconv'

module ApplicationHelper
  def self.unzip_file (file, destination)
    Zip::ZipFile.open(file) { |zip_file|
      zip_file.each { |f|
        f_path=File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      }
    }
  end

  def self.format_number(number)
    number.delete('.').to_f
  end
end



