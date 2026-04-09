# frozen_string_literal: true

module OpenFdaApi
  # Interact with the Drugs API Endpoint:
  #  - Adverse Events
  #  - Product Labeling
  #  - NDC Directory
  #  - Recall Enforcement Reports
  #  - Drugs@FDA)
  class Drugs < Endpoint
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/drug/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def adverse_events(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "event.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs)
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
      query    = build_query(inputs)
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
      query    = build_query(inputs)
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
      query    = build_query(inputs)
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
      query    = build_query(inputs)
      make_request(endpoint, query)
    end

    private

    def endpoint_path
      "/drug"
    end
  end
end
