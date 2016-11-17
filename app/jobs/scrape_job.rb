class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(search_id)
    Scrape.new search_id
  end
end
