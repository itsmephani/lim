class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(history_id)
    Scrape.new history_id
  end
end
