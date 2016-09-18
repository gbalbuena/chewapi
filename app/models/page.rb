class Page < ApplicationRecord
  validates :url, url: true
end
