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
        "foo" => "hello world"
      }
    }
  end

  describe "#build_query" do
    context "for search" do
      subject(:build_query) do
        described_class.new(valid_search_fields: dummy_valid_data, query_input: query_input).build_query
      end

      let(:query_input) { OpenFdaApi::QueryInputs.new(search: search) }
      context "with default" do
        subject(:build_query) do
          described_class.new(valid_search_fields: dummy_valid_data,
                              query_input: OpenFdaApi::QueryInputs.new).build_query
        end
        it { is_expected.to eq({}) }
      end

      context "with AND arguments" do
        let(:search) { [{ "a" => "b", "c" => "d" }] }
        it { is_expected.to eq(search: "(a:b+AND+c:d)") }
      end

      context "with OR arguments" do
        let(:search) { [{ "a" => "b" }, { "c" => "d" }] }
        it { is_expected.to eq(search: "(a:b)+(c:d)") }
      end

      context "with one argument" do
        let(:search) { [{ "a" => "b" }] }
        it { is_expected.to eq(search: "(a:b)") }
      end

      context "with both AND and OR arguments" do
        let(:search) { [{ "a" => "b", "c" => "d" }, { "e" => "f" }] }
        it { is_expected.to eq(search: "(a:b+AND+c:d)+(e:f)") }
      end

      context "with spaces in an argument" do
        let(:search) { [{ "foo" => "hello world" }] }
        it { is_expected.to eq(search: "(foo:hello+world)") }
      end

      context "with invalid arguments" do
        let(:search) { [{ "abadkey" => "a bad value" }, { "anotherbadkey" => "another bad value" }] }
        xit "raises an error" do
          expect { build_query }.to raise_error(OpenFdaApi::InvalidQueryArgument)
        end
      end
    end

    context "for sort" do
      subject(:build_query) do
        described_class.new(valid_search_fields: dummy_valid_data, query_input: query_input).build_query
      end
      let(:query_input) { OpenFdaApi::QueryInputs.new(sort: sort) }
      let(:sort) { [{ "a" => "b" }] }
      it "prepends with sort= correctly" do
        expect(build_query).to eq(sort: "(a:b)")
      end
    end

    context "for count" do
      subject(:build_query) do
        described_class.new(valid_search_fields: dummy_valid_data, query_input: query_input).build_query
      end
      let(:query_input) { OpenFdaApi::QueryInputs.new(count: count) }
      let(:count) { [{ "a" => "b" }] }
      it "prepends with count= correctly" do
        expect(build_query).to eq(count: "(a:b)")
      end
    end

    context "for skip" do
      subject(:build_query) do
        described_class.new(valid_search_fields: dummy_valid_data, query_input: query_input).build_query
      end
      let(:query_input) { OpenFdaApi::QueryInputs.new(skip: skip) }
      context "when positive" do
        let(:skip) { 1 }
        it { is_expected.to eq({ skip: "1" }) }
      end
      context "when negative" do
        let(:skip) { -1 }
        it { is_expected.to eq({}) }
      end
      context "when zero" do
        let(:skip) { 0 }
        it { is_expected.to eq({}) }
      end
    end
  end
end
