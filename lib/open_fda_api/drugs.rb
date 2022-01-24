# frozen_string_literal: true

require "net/http"
require "json"
require "yaml"

module OpenFdaApi
  # Interact with the Drugs API Endpoint:
  # - Adverse Events
  #  - Product Labeling
  #  - NDC Directory
  #  - Recall Enforcement Reports
  #  - Drugs@FDA)
  class Drugs
    attr_reader :client, :path_base

    def initialize(client)
      @client = client
      @host = "api.fda.gov"
      @path_base = "/drug"
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def adverse_events(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "event.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, self.class.valid_adverse_events_fields)
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def product_labeling(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "label.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def ndc_directory(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "ndc.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def recall_enforcement_reports(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "enforcement.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def drugs_at_fda(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "drugsfda.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    def self.valid_adverse_events_fields
      @valid_adverse_events_fields ||= ::YAML.load_file("#{__dir__}/adverse_events_fields.yml")
    end

    private

    def build_query(query_input, valid_search_fields)
      QueryBuilder.new(query_input: query_input, valid_search_fields: valid_search_fields).build_query
    end

    def build_inputs(search:, sort:, count:, skip:, limit:)
      QueryInputs.new(search: search, sort: sort, count: count, skip: skip, limit: limit)
    end

    def make_request(endpoint, query)
      url = "#{path_base}/#{endpoint}"
      if query.empty?
        client.connection.get(url)
      else
        client.connection.get(url, query)
      end.body
    end
  end
end
