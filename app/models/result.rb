class Result < ApplicationRecord
  include Paginate
  belongs_to :search

end
