require 'mechanize'

class Scrape

  attr_accessor :search, :page
  
  def initialize search_id
    @search = Search.find(search_id)
    @mechanize = Mechanize.new
    @mechanize.user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.121 Safari/535.2'
    get_page @search.url
    store_results
  end

  def get_page url
    @page =  @mechanize.get(url)
    rescue Exception => e
      puts e.message
  end

  def store_results
    Search::TAGS.each do |search_tag|
      results_of_tag = page.search(search_tag[:name])
      puts search_tag[:name]
      puts results_of_tag
      results_of_tag.each do |tag|
        result = Result.new({search_id: @search.id})
        result.content = tag.content
        result.tag_name = tag.name
        result.link = tag.attributes["href"].value if search_tag[:is_link]
        result.save

      end
    end
  end

end