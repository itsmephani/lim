require "rails_helper"

RSpec.describe Scrape, "results" do
  context "should scrape tags of the page and store results" do
    it "scrapes and stores results from page url in history" do
      url = "https://www.google.com"
      history = History.create(url: url)
      Scrape.new history.id
      expect(history.results.count).not_to eq(0)
    end
  end
end

