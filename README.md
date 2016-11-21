# README

LIM

Rotues:
1. api_history_results GET  /api/histories/:history_id/results(.:format)     api/results#index {:format=>:json}
2. api_history_result GET  /api/histories/:history_id/results/:id(.:format) api/results#show {:format=>:json}
3.       api_histories GET  /api/histories(.:format)                         api/histories#index {:format=>:json}
4.                    POST /api/histories(.:format)                         api/histories#create {:format=>:json}