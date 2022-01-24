# frozen_string_literal: true

module OpenFdaApi
  # Interact with the Other API Endpoint:
  #  - NSDE
  #  - Substance Data Reports
  class Other < Endpoint
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/other/nsde/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/other/nsde/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/other/nsde/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def nsde(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "nsde.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/other/substance/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/other/substance/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/other/substance/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def substance_data_reports(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "substance.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    private

    def endpoint_path
      "/other"
    end
  end
end
