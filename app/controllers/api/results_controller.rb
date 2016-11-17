module Api
  class ResultsController < CrudController
    self.nesting = Search
  end
end
