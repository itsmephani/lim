require 'mechanize'

class Search
  
  def initialize url    
    @links = []
    @result = {}
    @mechanize = Mechanize.new
    @mechanize.user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.121 Safari/535.2'
    get_page url
    store_results
  end

  def get_page url
    @page =  @mechanize.get(url)    
    # page.search('h1')
    rescue Exception => e
      puts e.message
  end

  def store_results
    Result.create(result)
  end

  def page
    @page
  end

end