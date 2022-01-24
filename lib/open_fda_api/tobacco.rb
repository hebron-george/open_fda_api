# frozen_string_literal: true

module OpenFdaApi
  # Interact with the Tobacco API Endpoint:
  #  - Problem Reports
  class Tobacco < Endpoint
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/tobacco/problem/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/tobacco/problem/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/tobacco/problem/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def problem_reports(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "problem.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    private

    def endpoint_path
      "/tobacco"
    end
  end
end
