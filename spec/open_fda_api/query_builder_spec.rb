# frozen_string_literal: true

require "open_fda_api/query_builder"

RSpec.describe OpenFdaApi::QueryBuilder do
  describe "#build_query" do
    context "for search" do
      subject(:build_query) { described_class.new(search: search).build_query }
      context "with default" do
        subject(:build_query) { described_class.new.build_query }
        it { is_expected.to eq("") }
      end

      context "with AND arguments" do
        let(:search) { [{ a: "b", c: "d" }] }
        it { is_expected.to eq("a:b+AND+c:d") }
      end

      context "with OR arguments" do
        let(:search) { [{ a: "b" }, { c: "d" }] }
        it { is_expected.to eq("a:b+c:d") }
      end
    end
  end
end
