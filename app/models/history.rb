class History < ApplicationRecord
  include Paginate

  has_many :results
  after_commit :scrape_page

  private
  def scrape_page
    ScrapeJob.perform_later self.id
  end
end
