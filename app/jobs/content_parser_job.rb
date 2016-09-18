class ContentParserJob < ApplicationJob
  queue_as :default

  def perform(page)
    page.parse
  end
end
