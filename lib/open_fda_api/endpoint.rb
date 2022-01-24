# frozen_string_literal: true

module OpenFdaApi
  # Base class for all endpoints to share behavior like building queries and making requests
  class Endpoint
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def build_query(query_input, valid_search_fields)
      QueryBuilder.new(query_input: query_input, valid_search_fields: valid_search_fields).build_query
    end

    def build_inputs(search:, sort:, count:, skip:, limit:)
      QueryInputs.new(search: search, sort: sort, count: count, skip: skip, limit: limit)
    end

    def make_request(endpoint, query)
      url = "#{endpoint_path}/#{endpoint}"
      if query.empty?
        client.connection.get(url)
      else
        client.connection.get(url, query)
      end.body
    end
  end
end
