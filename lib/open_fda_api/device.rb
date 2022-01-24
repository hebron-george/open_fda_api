# frozen_string_literal: true

module OpenFdaApi
  # Interact with the Device API Endpoint:
  #  - 501(k)
  #  - Classification
  #  - Recall Enforcement Reports
  #  - Adverse Events
  #  - Pre-market Approval
  #  - Recalls
  #  - Registrations and Listings
  #  - Covid19 Serological Testing Evaluations
  #  - Unique Device Identifier
  class Device < Endpoint
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/event/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/event/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/event/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def adverse_events(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "event.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {})
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/classification/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/classification/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/classification/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def classification(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "classification.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/510k/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/510k/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/510k/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def premarket_510ks(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "510k.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/enforcement/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/enforcement/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/enforcement/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def recall_enforcement_reports(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "enforcement.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/pma/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/pma/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/pma/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def premarket_approval(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "pma.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/recall/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/recall/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/recall/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def recalls(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "recall.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/registrationlisting/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/registrationlisting/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/registrationlisting/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def registrations_and_listings(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "registrationlisting.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/covid19serology/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/covid19serology/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/covid19serology/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def covid19_serological_tests(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "covid19serology.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/device/udi/searchable-fields/
    # @param sort   [Array<Hash>] Sort fields defined in https://open.fda.gov/apis/device/udi/searchable-fields/
    # @param count  [Array<Hash>] Count fields defined https://open.fda.gov/apis/device/udi/searchable-fields/
    # @param skip   [Integer]     Number of results to skip
    # @param limit  [Integer]     Number of results to return
    # @return Response from the API parsed as JSON
    def unique_device_identifier(search: [], sort: [], count: [], skip: 0, limit: 1)
      endpoint = "udi.json"
      inputs   = build_inputs(search: search, sort: sort, count: count, skip: skip, limit: limit)
      query    = build_query(inputs, {}) # TODO: Upload valid fields
      make_request(endpoint, query)
    end

    private

    def endpoint_path
      "/device"
    end
  end
end
