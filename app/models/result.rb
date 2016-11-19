class Result < ApplicationRecord
  include Paginate
  
  # Tags to be searched in the page.
  TAGS = [
    {name: 'h1', attributes: []},
    {name: 'h2', attributes: []},
    {name: 'h3', attributes: []},
    {name: 'a', attributes: ['href']}
  ]
  
  belongs_to :history


end
