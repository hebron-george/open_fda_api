# frozen_string_literal: true

module OpenFdaApi
  # Interact with the Transparency API Endpoint:
  #  - Complete Response Letters
  class Transparency < Endpoint
    # Complete Response Letters (CRL) are issued when the FDA determines it will not approve
    # a New Drug Application (NDA) or Biologics License Application (BLA) in its current form.
    #
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/transparency/completeresponseletters/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/transparency/completeresponseletters/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined in https://open.fda.gov/apis/transparency/completeresponseletters/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def complete_response_letters(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "crl.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs)
      make_request(endpoint, query)
    end

    private

    def endpoint_path
      "/transparency"
    end
  end
end
