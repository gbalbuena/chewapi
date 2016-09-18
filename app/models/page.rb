require 'nokogiri'
require 'open-uri'

class Page < ApplicationRecord
  before_create :parse
  validates :url, url: true

  private
    def parse
      doc = Nokogiri::HTML(open(self.url).read)
      self.content = doc.css('h1', 'h2', 'h3', 'a')
        .collect { |l| l.content.strip }.delete_if { |l| l.blank? }.join("\n")
    end
end
