# frozen_string_literal: true

module OpenFdaApi
  # Group of inputs to build the query against the API with
  class QueryInputs
    attr_reader :search, :sort, :count, :skip, :limit, :api_key

    def initialize(**params)
      @search  = params[:search]  || []
      @sort    = params[:sort]    || []
      @count   = params[:count]   || []
      @skip    = params[:skip]    || 0
      @limit   = params[:limit]   || nil
      @api_key = params[:api_key] || nil
    end
  end
end
