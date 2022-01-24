# frozen_string_literal: true

RSpec.describe OpenFdaApi::Drugs do
  let(:instance) { client.drugs }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#adverse_events API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/drug/event.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/drugs/adverse_events.json")]
        end
      end
    end
    subject(:adverse_events_call) { instance.adverse_events }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#product_labeling API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/drug/label.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/drugs/label.json")]
        end
      end
    end
    subject(:product_labeling_call) { instance.product_labeling }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#ndc_directory API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/drug/ndc.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/drugs/ndc.json")]
        end
      end
    end
    subject(:ndc_directory_call) { instance.ndc_directory }
    it "converts the response to a Hash" do
      expect(ndc_directory_call.class).to eq(Hash)
    end
  end

  context "#recall_enforcement_reports API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/drug/enforcement.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/drugs/enforcement.json")]
        end
      end
    end
    subject(:recall_enforcement_reports_call) { instance.recall_enforcement_reports }
    it "converts the response to a Hash" do
      expect(recall_enforcement_reports_call.class).to eq(Hash)
    end
  end

  context "#drugs_at_fda API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/drug/drugsfda.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/drugs/drugsfda.json")]
        end
      end
    end
    subject(:drugs_at_fda_call) { instance.drugs_at_fda }
    it "converts the response to a Hash" do
      expect(drugs_at_fda_call.class).to eq(Hash)
    end
  end
end
