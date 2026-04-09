# frozen_string_literal: true

module OpenFdaApi
  class InvalidQueryArgument < ArgumentError; end

  # A helper to build queries against the openFDA API
  #
  # The API supports five query parameters. The basic building block of queries is the search parameter.
  # Use it to "filter" requests to the API by looking in specific fields for matches.
  # Each endpoint has its own unique fields that can be searched.
  #
  # search:
  #   What to search for, in which fields. If you don't specify a field to search, the API will search in every field.
  # sort:
  #   Sort the results of the search by the specified field in ascending or descending order by using the
  #   :asc or :desc modifier.
  # count:
  #   Count the number of unique values of a certain field, for all the records that matched the search parameter.
  #   By default, the API returns the 1000 most frequent values.
  # limit:
  #   Return up to this number of records that match the search parameter. Currently, the largest allowed value for the
  #   limit parameter is 1000.
  # skip:
  #   Skip this number of records that match the search parameter, then return the matching records that follow.
  #   Use in combination with limit to paginate results. Currently, the largest allowed value for the skip parameter
  #   is 25000. See Paging if you require paging through larger result sets.
  class QueryBuilder
    # @param [QueryInputs] query_input
    def initialize(query_input:)
      @search  = build_query_string(query_fields: query_input.search)
      @sort    = build_query_string(query_fields: query_input.sort)
      @count   = build_query_string(query_fields: query_input.count)
      @skip    = build_skip_string(query_input.skip)
      @limit   = query_input.limit
      @api_key = query_input.api_key
    end

    # @return [Hash] the query string portion of a request
    def build_query
      {
        api_key: @api_key,
        search: @search,
        sort: @sort,
        count: @count,
        skip: @skip,
        limit: @limit
      }.compact.reject { |_k, v| v.to_s.empty? }
    end

    private

    def build_query_string(query_fields:)
      return "" if query_fields.empty?

      build_groupings(query_fields).to_s
    end

    def build_skip_string(skip)
      skip.positive? ? skip.to_s : ""
    end

    def build_groupings(fields)
      fields.map do |and_args|
        "(#{and_args.map { |k, v| "#{k}:#{v.gsub(" ", "+")}" }.join("+AND+")})"
      end.join("+")
    end
  end
end
