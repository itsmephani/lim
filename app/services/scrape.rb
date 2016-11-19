require 'mechanize'

class Scrape

  attr_accessor :history, :page
  
  def initialize history_id
    @history = History.find(history_id)
    @mechanize = Mechanize.new
    @mechanize.user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.121 Safari/535.2'
    get_page @history.url
    store_results
  end

  def get_page url
    @page =  @mechanize.get(url)
    rescue Exception => e
      puts e.message
  end

  def store_results
    Result::TAGS.each do |search_tag|
      results_of_tag = page.search(search_tag[:name])
      results_of_tag.each do |tag|
        result = Result.new({history_id: @history.id})
        result.content = tag.content
        result.tag_name = tag.name
        attributes = search_tag[:attributes] || []
        attributes.each do |attribute|
          if tag.attributes[attribute] && tag.attributes[attribute].value
            result.tag_attributes[attribute] = tag.attributes[attribute].value
          end
        end 
        result.save

      end
    end
  end

end