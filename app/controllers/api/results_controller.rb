module Api
  class ResultsController < CrudController
    self.nesting = History
  end
end
