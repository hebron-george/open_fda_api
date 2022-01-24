# frozen_string_literal: true

module OpenFdaApi
  # Interact with the Food API Endpoint:
  #  - Adverse Events
  #  - Recall Enforcement Reports
  class Food < Endpoint
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/food/enforcement/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/food/enforcement/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/food/enforcement/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def adverse_events(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "event.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/food/enforcement/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/food/enforcement/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/food/enforcement/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def recall_enforcement_reports(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "enforcement.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    private

    def endpoint_path
      "/food"
    end
  end
end
