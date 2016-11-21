module Api
  class HistoriesController < CrudController
    self.permitted_attrs = ["url"]
  end
end
