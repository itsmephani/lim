# README

LIM
## STARTING THE APP ##
1. bundle install
2. rake db:create & db:migrate
3. Install redis-server and start
4. rails s
5. bundle exec sidekiq # need to start sidekiq for processing(scraping) url in background.
6. bundle exec rspec # run test case (scrape results shouldn't be empty).



Rotues:
1. List all the results for a url.
api_history_results GET  /api/histories/:history_id/results(.:format)     api/results#index {:format=>:json}
Params:
history_id

2. List all the urls.
api_histories  GET  /api/histories(.:format)                         api/histories#index {:format=>:json}

3. List all the results for a url.
api_histories  POST /api/histories(.:format)                         api/histories#create {:format=>:json}
Params:
history: {url: 'https://github.com/'}

## Scrape ##
app/services/scrap.rb has the functionality of scraping.


## UI - Reactjs ##
Code exists in public/limWeb
