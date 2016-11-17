class Search < ApplicationRecord
  include Paginate

  # Tags to be searched for in the page.
  TAGS = [
    {name: 'h1', is_link: false},
    {name: 'h2', is_link: false},
    {name: 'h3', is_link: false},
    {name: 'a', is_link: true}
  ]

  has_many :results
  after_commit :scrape_page


  private
  def scrape_page
    ScrapeJob.perform_later self.id
  end
end
