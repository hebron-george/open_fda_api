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
    # @param [Hash] valid_search_fields
    # @param [QueryInput] query_input
    def initialize(query_input:, valid_search_fields:)
      # TODO: Turn validations back on once we get basic functionality working; need to flex on different field types
      # validate_arguments!(valid_search_fields, query_input: query_input)
      warn "You've passed in a valid_search_fields arg but it isn't being used right now..." if valid_search_fields
      @search = build_query_string(query_fields: query_input.search)
      @sort   = build_query_string(query_fields: query_input.sort)
      @count  = build_query_string(query_fields: query_input.count)
      @skip   = build_skip_string(query_input.skip)
      @limit  = query_input.limit
    end

    # @return [Hash] the query string portion of a request
    def build_query
      {
        search: @search,
        sort: @sort,
        count: @count,
        skip: @skip,
        limit: @limit
      }.compact.reject { |_k, v| v.to_s.empty? }
    end

    private

    def validate_arguments!(valid_search_fields, query_input:)
      # `search` keys must exist in adverse_events_fields.yml
      invalid_fields = get_invalid_fields(valid_search_fields: valid_search_fields, fields: query_input.search)
      raise InvalidQueryArgument, "'search' has invalid fields: #{invalid_fields}" if invalid_fields.any?

      # `sort` keys must exist in adverse_events_fields.yml
      invalid_fields = get_invalid_fields(valid_search_fields: valid_search_fields, fields: query_input.sort)
      raise InvalidQueryArgument, "'sort' has invalid fields: #{invalid_fields}" if invalid_fields.any?

      # `count` keys must exist in adverse_events_fields.yml
      invalid_fields = get_invalid_fields(valid_search_fields: valid_search_fields, fields: query_input.count)
      raise InvalidQueryArgument, "'count' has invalid fields: #{invalid_fields}" if invalid_fields.any?

      # `count` and `skip` cannot be set at the same time
      return unless count_and_skip_set?(query_input.count, query_input.skip)

      raise InvalidQueryArgument, "'count' and 'skip' cannot both be set at the same time!"
    end

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

    def get_invalid_fields(valid_search_fields:, fields:)
      # TODO: valid_search_fields define types and we need to check against those
      fields.map(&:keys).flatten.select do |field|
        if field.include?(".") # nested field (e.g. patient.patientagegroup)
          dig_values = field.split(".").join(",properties,").split(",")
          valid_search_fields["properties"].dig(*dig_values).nil?
        else
          !valid_search_fields["properties"].keys.include?(field.to_s)
        end
      end
    end

    def count_and_skip_set?(count, skip)
      skip.positive? && !count.empty?
    end
  end
end
