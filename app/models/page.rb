require 'nokogiri'
require 'open-uri'

class Page < ApplicationRecord
  validates :url, url: true
  after_create :send_to_queue

  private
    def send_to_queue
      ContentParserJob.perform_later self
    end
    def parse
      doc = Nokogiri::HTML(open(self.url).read)
      self.content = doc.css('h1', 'h2', 'h3', 'a')
        .collect { |l| l.content.strip }.delete_if { |l| l.blank? }.join("\n")
    end
end
