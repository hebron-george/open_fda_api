# frozen_string_literal: true

require "open_fda_api/query_builder"

RSpec.describe OpenFdaApi::QueryBuilder do
  let(:dummy_valid_data) do
    {
      "type" => "object",
      "properties" => {
        "a" => "b",
        "c" => "d",
        "e" => "f",
        "foo" => "hello world",
        "atoplevelkey" => {
          format: "int32",
          is_exact: false,
          type: "string",
          pattern: nil,
          description: "Just a fake thingy",
          possible_values: nil
        },
        "someother" => {
          type: "object",
          properties: {
            nestedthing: {
              format: "int32",
              is_exact: false,
              type: "string",
              pattern: nil,
              description: "Another fake thingy, but this one is nested",
              possible_values: nil
            }
          }
        }
      }
    }
  end
  describe "#build_query" do
    context "for search" do
      subject(:build_query) { described_class.new(valid_search_fields: dummy_valid_data, search: search).build_query }
      context "with default" do
        subject(:build_query) { described_class.new(valid_search_fields: dummy_valid_data).build_query }
        it { is_expected.to eq("") }
      end

      context "with AND arguments" do
        let(:search) { [{ "a" => "b", "c" => "d" }] }
        it { is_expected.to eq("search=(a:b+AND+c:d)") }
      end

      context "with OR arguments" do
        let(:search) { [{ "a" => "b" }, { "c" => "d" }] }
        it { is_expected.to eq("search=(a:b)+(c:d)") }
      end

      context "with one argument" do
        let(:search) { [{ "a" => "b" }] }
        it { is_expected.to eq("search=(a:b)") }
      end

      context "with both AND and OR arguments" do
        let(:search) { [{ "a" => "b", "c" => "d" }, { "e" => "f" }] }
        it { is_expected.to eq("search=(a:b+AND+c:d)+(e:f)") }
      end

      context "with spaces in an argument" do
        let(:search) { [{ "foo" => "hello world" }] }
        it { is_expected.to eq("search=(foo:hello+world)") }
      end

      context "with invalid arguments" do
        let(:search) { [{ "abadkey" => "a bad value" }, { "anotherbadkey" => "another bad value" }] }
        it "raises an error" do
          expect { build_query }.to raise_error(OpenFdaApi::InvalidQueryArgument)
        end
      end
    end
  end
end
